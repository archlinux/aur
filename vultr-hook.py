#!/usr/bin/env python3
import os
import requests
import sys
from typing import Iterator

DOMAIN = os.environ.get("CERTBOT_DOMAIN")
TOKEN = os.environ.get("CERTBOT_VALIDATION")
AUTH_OUTPUT = os.environ.get("CERTBOT_AUTH_OUTPUT")
API_KEY = os.environ.get("VULTR_API_KEY")

API_EP = "https://api.vultr.com/v1/"
DOMAIN_LIST_EP = "{}{}".format(API_EP, "dns/list")
RECORD_LIST_EP = "{}{}".format(API_EP, "dns/records")
RECORD_ADD_EP = "{}{}".format(API_EP, "dns/create_record")
RECORD_DEL_EP = "{}{}".format(API_EP, "dns/delete_record")
SESSION = requests.Session()
SESSION.headers.update({"API-Key": API_KEY})


def main():
    if None in [DOMAIN, TOKEN, API_KEY]:
        sys.stderr.write("CERTBOT_DOMAIN, CERTBOT_VALIDATION "
                         " and VULTR_API_KEY must all be defined\n")
        sys.exit(1)

    if AUTH_OUTPUT is None:
        pre_hook()
    else:
        post_hook()


def subdomains(domain: str) -> Iterator[str]:
    """Generator of all subdomains within the domain,
    given from the longest to the shortest.

    Ex: "one.two.three" ->
            "one.two.three"
            "two.three"
            "three"
    """
    for i in range(domain.count(".") + 1):
        yield domain.split(".", i)[-1]


def pre_hook():
    """Add a new TXT record."""

    # extract all domains managed by the Vultr API
    managed_domains = SESSION.get(DOMAIN_LIST_EP).json()
    managed_domains = [o["domain"] for o in managed_domains]
    managed_domain = None

    # find the subdomain of DOMAIN managed by Vultr
    for subdomain in subdomains(DOMAIN):
        if subdomain in managed_domains:
            managed_domain = subdomain
            break
    if managed_domain is None:
        raise ValueError(
            "no suitable managed domain found for {}".format(DOMAIN))

    # echo managed domain for post hook to pick up
    sys.stdout.write(managed_domain)

    # get the subdomain part relative to the managed domain
    subdomain = DOMAIN.rpartition(managed_domain)[0][:-1]

    # add the record
    if subdomain == "":
        name = "_acme-challenge"
    else:
        name = "_acme-challenge.{}".format(subdomain)
    SESSION.post(
        RECORD_ADD_EP,
        data={
            "domain": managed_domain,
            "name": name,
            "type": "TXT",
            "data": '"{}"'.format(TOKEN),
        }).raise_for_status()


def post_hook():
    """Remove the added TXT record."""

    managed_domain = AUTH_OUTPUT
    records = SESSION.get(
        RECORD_LIST_EP, params={
            "domain": managed_domain,
        }).json()
    txt_records = [r for r in records if r["type"] == "TXT"]
    record = [r for r in txt_records if r["data"] == '"{}"'.format(TOKEN)][0]
    SESSION.post(
        RECORD_DEL_EP,
        data={
            "domain": managed_domain,
            "RECORDID": record["RECORDID"]
        }).raise_for_status()


if __name__ == "__main__":
    main()
