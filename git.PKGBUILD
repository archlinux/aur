source PKGBUILD

pkgdesc="Skywire Mainnet Node implementation. Skycoin.com - develop branch"
pkgver=1.2.1
#build a branch with BRANCH=branch
#build a fork with FORK=<github-username>
source=("git+${url}.git#branch=${BRANCH:-develop}"
"${_source[@]}"
)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
_version=$(git ls-remote --tags --refs --sort="version:refname" ${url}.git | tail -n1)
_version=${_version##*/}
_version=${_version%%-*}
_version=${_version//v/}
echo ${_version}
}

prepare() {
# https://wiki.archlinux.org/index.php/Go_package_guidelines
mkdir -p ${srcdir}/go/src/github.com/${_githuborg}/ ${srcdir}/go/bin ${srcdir}/go/apps
ln -rTsf ${srcdir}/${_pkgname} ${srcdir}/go/src/${_pkggopath}
cd ${srcdir}/go/src/${_pkggopath}/
}

build() {
cd ${srcdir}/go/src/${_pkggopath}
#build the frontend. Normlly not necessary
#make build-ui
export GOPATH=${srcdir}/go
export GOBIN=${GOPATH}/bin
export _GOAPPS=${GOPATH}/apps
export GOOS=linux
export CGO_ENABLED=1  #default anyways
#use musl-gcc for static compilation
export CC=musl-gcc
rm -rf ${srcdir}/${pkgname}-${pkgver}${_rc}
ln -fs ${srcdir}/${pkgname} ${srcdir}/${pkgname}-${pkgver}${_rc}
_build
}
