## systemd-resolved-public-dns

This is a collection of configuration snippets defining DNS servers to be used by systemd's Network Name Resolution manager, systemd-resolved.

## Motivation

Public DNS servers offer faster browsing speeds and improved security compared to private services, such as those offered by your ISP. DuckDuckHack compiled a broad collection of IPv4 and IPv6 public DNS services as part of a [DuckDuckGo Instant Answer](https://github.com/duckduckgo/zeroclickinfo-goodies/blob/master/share/goodie/public_dns/providers.yml). The IPFire wiki maintains a [similarly large list](https://wiki.ipfire.org/dns/public-servers) including DNSSEC validation.

## Installation

All configuration snippets should be installed into the vendor configuration directory, /usr/lib/systemd/resolved.conf.d. These vendor-supplied snippets should be disabled on default by placing a symlink to /dev/null in the local configuration directory, /etc/systemd/resolved.conf.d, with the same filename as the vendor configuration file.

## Configuration

Each snippet can be enabled by removed the corresponding symlink in the local configuration directory. The settings aggregated across all enabled configuration snippets are applied in the order based on the lexicographical sorting of the configuration filenames. Prefixing these configuration files with numbers will simplify the ordering of these files.

## Contributors

- DuckDuckGo: [list of DNS server addresses](https://github.com/duckduckgo/zeroclickinfo-goodies/blob/master/share/goodie/public_dns/providers.yml)
- IPFire: [DNSSEC-specific list](https://wiki.ipfire.org/dns/public-servers)
