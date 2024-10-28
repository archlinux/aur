import os.path as op
import tempfile
from subprocess import check_call, check_output

import requests
from bs4 import BeautifulSoup, element
from jinja2 import Environment, FileSystemLoader


def get_latest_version() -> dict:
    url = "https://get.gear.rs/"
    response = requests.get(url, timeout=10)
    root = BeautifulSoup(response.text, 'html.parser')
    build_tags = root.find_all('div', class_='builds')

    latest_build_tag: element.Tag = build_tags[1]
    header_tag = latest_build_tag.find_next()
    fileds = header_tag.text.split(' - ')
    assert len(fileds) == 2
    assert fileds[0] == 'Release Builds'
    version = fileds[1][1:]

    list_items: element.ResultSet = latest_build_tag.find_all('li')
    linux_item: element.Tag = next(
        (item for item in list_items if '-linux' in item.text)
    )
    href = linux_item.find_next('a').get('href')

    return {
        "version": version,
        "href": href
    }


def get_sha256sum(url: str) -> str:
    with tempfile.TemporaryDirectory(delete=False) as temp_dir:
        temp_file = op.join(temp_dir, "temp.bin")
        print(f"Downloading {url} to {temp_file}")
        check_call(f"wget {url} -O {temp_file}", shell=True)
        return (
            check_output(f"sha256sum {temp_file}", shell=True)
            .decode()
            .split(' ', maxsplit=1)[0]
        )


def get_current_version():
    with open("PKGBUILD", "r", encoding="utf-8") as f:
        lines = f.readlines()
    version_line = next(
        (line for line in lines if line.startswith('pkgver='))
    )

    return version_line.lstrip('pkgver=v').rstrip()


def compare_version(a: str, b: str):
    a = a.split(".")
    b = b.split(".")

    for i, j in zip(a, b):
        if int(i) > int(j):
            return 1
        if int(i) < int(j):
            return -1

    return 0


def main():
    latest_version = get_latest_version()
    current_version = get_current_version()

    cmp = compare_version(current_version, latest_version["version"])
    if cmp == 1:
        print("WARN: current version is newer than latest version.")
    elif cmp == 0:
        print("Already up to date.")
    else:
        print(
            f"Update version from {current_version} to "
            f"{latest_version['version']}"
        )
        data = {
            "version": latest_version["version"],
            "source": latest_version["href"],
            "sha256sum": get_sha256sum(latest_version["href"]),
        }
        print("data:", data)
        env = Environment(loader=FileSystemLoader("."))
        template = env.get_template("PKGBUILD.j2")
        output = template.render(data)
        with open("PKGBUILD", "w", encoding="utf-8") as f:
            f.write(output)


if __name__ == '__main__':
    main()
