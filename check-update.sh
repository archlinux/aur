#!/usr/bin/env bash

# NOTE:
# The output URL is cached by the Sidekick server, meaning it may not always reflect the latest version.
# As a result, the URL obtained can vary with each request.
# To ensure you get the most recent version URL, you may need to make multiple requests.
curl -s -I "https://api.meetsidekick.com/downloads/linux/deb" | grep -i "location" | awk '{print $2}'
