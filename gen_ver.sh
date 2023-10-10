#!/usr/bin/env sh

source ./.pkg_config

git_dir=".$pkgname-git-clone__"

echo "test $git_dir"

if [ -d "$git_dir" ]; then
    echo "Directory exists. Assuming git structure and continuing"
else
    git clone "$url" "$git_dir"
fi

pushd "$git_dir"

version="$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

popd

sed s/__VERSION/"$version"/ < ./_PKGBUILD > ./PKGBUILD
sed s/__VERSION/"$version"/ < ./_.SRCINFO > ./.SRCINFO

echo "Updated version, committing."
git add PKGBUILD .SRCINFO
git commit -m "Update version to $version"
echo "Pushing!"
git push
