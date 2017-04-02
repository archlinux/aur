#!/bin/bash

export version=$1
export hash=$(curl -L https://github.com/hashicorp/terraform/archive/v$version.tar.gz | sha256sum | awk {'print $1'})

cat PKGBUILD.template| envsubst | sed  's/\${{/\${/g' > PKGBUILD
mksrcinfo

git add PKGBUILD .SRCINFO
git commit -m $version
