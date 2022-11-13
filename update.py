#!/usr/bin/env python
from html.parser import HTMLParser
from urllib.error import HTTPError
from urllib.parse import urlencode
import argparse
import getpass
import hashlib
import http.cookiejar
import json
import re
import subprocess as subp
import urllib.request as req

parser = argparse.ArgumentParser(
    description="Update PKGBUILD and .SRCINFO to the latest Foundry VTT version"
)
parser.add_argument(
    "--no-commit", action="store_true", help="Do not commit the changes"
)
args = parser.parse_args()


class CsrfMiddlewareParser(HTMLParser):
    def handle_starttag(self, tag, attrs):
        attrs = dict(attrs)
        if (
            tag == "input"
            and "name" in attrs
            and attrs["name"] == "csrfmiddlewaretoken"
        ):
            self.csrfmiddlewaretoken = attrs["value"]


class ReleasesParser(HTMLParser):
    def __init__(self):
        super().__init__()
        self.in_release = False
        self.curr_release = None
        self.releases = []

    def handle_starttag(self, tag, attrs):
        attrs = dict(attrs)
        if tag == "li" and "class" in attrs and "release" in attrs["class"].split():
            self.in_release = True
        elif (
            self.in_release
            and tag == "a"
            and "href" in attrs
            and attrs["href"].startswith("/releases/")
        ):
            self.curr_release = tuple(
                int(n) for n in attrs["href"].split("/")[-1].split(".")
            )
        elif (
            self.in_release
            and tag == "span"
            and "class" in attrs
            and "stable" in attrs["class"].split()
        ):
            self.releases.append(self.curr_release)

    def handle_endtag(self, tag):
        if tag == "li":
            self.in_release = False


cookiejar = http.cookiejar.LWPCookieJar("foundry_login_cookies.txt")
try:
    cookiejar.load()
except OSError:
    pass
opener = req.build_opener(req.HTTPCookieProcessor(cookiejar))

if "sessionid" not in (c.name for c in cookiejar):
    with opener.open("https://foundryvtt.com/") as res:
        csrfmiddleware_parser = CsrfMiddlewareParser()
        csrfmiddleware_parser.feed(res.read().decode())
        csrfmiddlewaretoken = csrfmiddleware_parser.csrfmiddlewaretoken

    with open("/dev/tty", "r+b", buffering=0) as f:
        f.write("Foundry username: ".encode())
        username = f.readline().decode()
    password = getpass.getpass(prompt="Foundry password: ")

    auth = urlencode(
        {
            "csrfmiddlewaretoken": csrfmiddlewaretoken,
            "login_redirect": "/",
            "login_username": username,
            "login_password": password,
            "login": "",
        }
    )
    auth_req = req.Request(
        "https://foundryvtt.com/auth/login/",
        headers={"Referer": "https://foundryvtt.com/"},
        data=auth.encode(),
    )
    with opener.open(auth_req) as res:
        csrftoken_cookie = res.getheader("Set-Cookie").split(";")[0]
    cookiejar.save()

with opener.open("https://foundryvtt.com/releases/") as res:
    release_parser = ReleasesParser()
    release_parser.feed(res.read().decode())
    latest_release = max(release_parser.releases)

with open("PKGBUILD", "r") as f:
    pkgbuild = f.read()

curr_version = tuple(
    int(n) for n in re.search(r"pkgver\s*=\s*([\d\.]+)", pkgbuild).group(1).split(".")
)

if latest_release > curr_version:
    release_str = ".".join(str(n) for n in latest_release)
    download_req = req.Request(
        f"https://foundryvtt.com/releases/download?build={latest_release[-1]}&platform=linux&response_type=json"
    )
    with opener.open(download_req) as res:
        download_url = json.loads(res.read())["url"]
    with opener.open(download_url) as res:
        with open(f"FoundryVTT-{release_str}.zip", "wb") as f:
            hasher = hashlib.sha256()
            chunk = res.read(1024)
            while len(chunk) > 0:
                f.write(chunk)
                hasher.update(chunk)
                chunk = res.read(1024)

    package_hash = hasher.hexdigest()
    new_pkgbuild = re.sub(
        r"(sha256sums\s*=\s*\(\s*['\"]?)[\da-zA-Z]{64}(['\"]?\s*\))",
        rf"\g<1>{package_hash}\2",
        pkgbuild,
    )
    new_pkgbuild = re.sub(
        r"(pkgver\s*=\s*)[\d\.]+",
        rf"\g<1>{release_str}",
        new_pkgbuild,
    )
    with open("PKGBUILD", "w") as f:
        f.write(new_pkgbuild)
    with open(".SRCINFO", "w") as f:
        subp.run(["makepkg", "--printsrcinfo"], stdout=f)
    if not args.no_commit:
        subp.run(
            ["git", "commit", "-m", f"Update to {release_str}", "PKGBUILD", ".SRCINFO"]
        )
else:
    print("Already up to date")
