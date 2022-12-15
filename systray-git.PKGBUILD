 # Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
_projectname=skycoin
pkgname=skywire-systray
_pkgname=${pkgname/-systray/}
_githuborg=${_projectname}
pkgdesc="Skywire systray. Skycoin.com"
_pkggopath="github.com/${_githuborg}/${_pkgname}"
pkgver=1.2.1
pkgrel=1
#pkgrel=1
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' )
url="https://${_pkggopath}"
license=()
makedepends=('git' 'go' 'musl' 'kernel-headers-musl')
depends=('skywire')
source=("git+${url}.git#branch=develop"
)
sha256sums=('SKIP')

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
export GOPATH=${srcdir}/go
export GOBIN=${GOPATH}/bin
export _GOAPPS=${GOPATH}/apps
export GOOS=linux
export CGO_ENABLED=1  #default anyways
#use musl-gcc for static compilation
export CC=musl-gcc

local _version="${pkgver}"
DMSG_BASE="github.com/skycoin/dmsg"
BUILDINFO_PATH="${DMSG_BASE}/buildinfo"
BUILDINFO_VERSION="${BUILDINFO_PATH}.version=${_version}"
BUILDINFO=${BUILDINFO_VERSION} ${BUILDINFO_DATE} ${BUILDINFO_COMMIT}

#create the skywire binaries
cd ${srcdir}/go/src/${_pkggopath}
_cmddir=${srcdir}/go/src/${_pkggopath}/cmd

_msg2 "building skywire-systray binary"
cd ${_cmddir}/skywire-systray
go build -trimpath --ldflags="" --ldflags "${BUILDINFO} -s -w -linkmode external -extldflags '-static' -buildid=" -o $GOBIN .

#binary transparency
cd $GOBIN
_msg2 'binary sha256sums'
sha256sum $(ls)
}

package() {
_pkgdir=${pkgdir}
_msg2 'installing binaries'
mkdir -p ${_pkgdir}/usr/bin/
install -Dm755 ${GOBIN}/skywire-systray ${_pkgdir}/usr/bin/
}

_msg2() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}
