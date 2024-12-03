source PKGBUILD
url="https://github.com/cogentcore/core"
pkgver=0.3.5
pkgdesc="cogentcore's core tool built from main branch instead of latest release tag version"
makedepends=("${makedepends[@]}" "git")


pkgver() {
_version=$(git ls-remote --tags --refs --sort="version:refname" ${url}.git | tail -n1)
_version=${_version##*/}
_version=${_version%%-*}
_version=${_version//v/}
echo ${_version}
}

build() {
_build "main"
}
