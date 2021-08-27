#!/bin/bash

echo "# Name: $(gh release --repo https://github.com/yang991178/fluent-reader/ view --json name | jq -r .name)" >changelog.md
echo "### URL: $(gh release --repo https://github.com/yang991178/fluent-reader/ view --json url | jq -r .url)" >>changelog.md
echo "### published at '$(gh release --repo https://github.com/yang991178/fluent-reader/ view --json publishedAt | jq -r .publishedAt)' by $(gh release --repo https://github.com/yang991178/fluent-reader/ view --json author | jq -r .author.login)" >>changelog.md
echo "---" >>changelog.md
gh release --repo https://github.com/yang991178/fluent-reader/ view --json body | jq -r .body >>changelog.md
