source PKGBUILD

pkgdesc="Software defined networking with public keys. Skycoin.com"
#build a branch with BRANCH=branch
#build a fork with FORK=<github-username>
source=(#"git+${url}.git#branch=${BRANCH:-develop}"
"${_source[@]}"
)
sha256sums=('SKIP')

pkgver() {
_version=$(go list -mod=mod -m github.com/skycoin/skywire@develop | cut -d' ' -f2)
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
# Build the develop tip, not the release tag. Without this the inherited
# _build would `go install ...@v${pkgver}` and this "-git" package would
# silently ship the last release instead of develop.
_goref=develop
_build
}
