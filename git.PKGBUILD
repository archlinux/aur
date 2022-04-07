 # Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
_projectname=skycoin
pkgname=skywire
_pkgname=${pkgname}
_githuborg=${_projectname}
pkgdesc="Skywire Mainnet Node implementation. Skycoin.com"
_pkggopath="github.com/${_githuborg}/${_pkgname}"
pkgver=0.6.0
pkgrel=1
#pkgrel=1
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' )
url="https://${_pkggopath}"
license=()
makedepends=('git' 'go' 'musl' 'kernel-headers-musl') #disable signature check pending fixes#  'skycoin-keyring')
install=skywire.install
_scripts=${_pkgname}-scripts
source=("git+${url}.git#branch=develop"
"${_scripts}.tar.gz"
)
sha256sums=('SKIP'
            '9808ca83ba706effe45a23a242e91a24d637979cc5886e59333e8d560fa8682b')

pkgver() {
cd ${srcdir}/${_pkgname}
local _version=$(make version)
_version=${_version%%-*}
echo ${_version//v/}
}

prepare() {
# https://wiki.archlinux.org/index.php/Go_package_guidelines
mkdir -p ${srcdir}/go/src/github.com/${_githuborg}/ ${srcdir}/go/bin ${srcdir}/go/apps
ln -rTsf ${srcdir}/${pkgname} ${srcdir}/go/src/${_pkggopath}
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
#git fetch
#git checkout develop
_cmddir=${srcdir}/go/src/${_pkggopath}/cmd

#static compilation with 'musl' avoids glibc runtime deps
#which cause binary to fail if correct glibc / libc6 is not found on the system

_msg2 "building skychat binary"
cd ${_cmddir}/apps/skychat
go build -trimpath --ldflags="" --ldflags "${BUILDINFO} -s -w -linkmode external -extldflags '-static' -buildid=" -o $_GOAPPS .
_msg2 "building skysocks binary"
cd ${_cmddir}/apps/skysocks
go build -trimpath --ldflags="" --ldflags "${BUILDINFO} -s -w -linkmode external -extldflags '-static' -buildid=" -o $_GOAPPS .
_msg2 "building skysocks-client binary"
cd ${_cmddir}/apps/skysocks-client
go build -trimpath --ldflags="" --ldflags "${BUILDINFO} -s -w -linkmode external -extldflags '-static' -buildid=" -o $_GOAPPS .
_msg2 "building vpn-client binary"
cd ${_cmddir}/apps/vpn-client
go build -trimpath --ldflags="" --ldflags "${BUILDINFO} -s -w -linkmode external -extldflags '-static' -buildid=" -o $_GOAPPS .
_msg2 "building vpn-server binary"
cd ${_cmddir}/apps/vpn-server
go build -trimpath --ldflags="" --ldflags "${BUILDINFO} -s -w -linkmode external -extldflags '-static' -buildid=" -o $_GOAPPS .
_msg2 "building skywire-cli binary"
cd ${_cmddir}/skywire-cli
go build -trimpath --ldflags="" --ldflags "${BUILDINFO} -s -w -linkmode external -extldflags '-static' -buildid=" -o $GOBIN .
_msg2 "building skywire-visor binary"
cd ${_cmddir}/skywire-visor
go build -trimpath --ldflags="" --ldflags "${BUILDINFO} -s -w -linkmode external -extldflags '-static' -buildid=" -o $GOBIN .
_msg2 "building setup-node binary"
cd ${_cmddir}/setup-node
go build -trimpath --ldflags="" --ldflags "${BUILDINFO} -s -w -linkmode external -extldflags '-static' -buildid=" -o $GOBIN .

#binary transparency
cd $GOBIN
_msg2 'binary sha256sums'
sha256sum $(ls)
cd $_GOAPPS
sha256sum $(ls)
}

package() {
_pkgdir=${pkgdir}
#create directory trees or the visor might make them with weird permissions
#only path differing between debian & archlinux
_systemddir="usr/lib/systemd/system"
_skydir="opt/skywire"
_skyapps="${_skydir}/apps"
_skyscripts="${_skydir}/scripts"
_skybin="${_skydir}/bin"
_msg2 'creating dirs'
mkdir -p ${_pkgdir}/usr/bin
mkdir -p ${_pkgdir}/${_skydir}/bin
mkdir -p ${_pkgdir}/${_skydir}/apps
mkdir -p ${_pkgdir}/${_skydir}/local
mkdir -p ${_pkgdir}/${_skydir}/${_pkgname}
mkdir -p ${_pkgdir}/${_skydir}/${_pkgname}-save
mkdir -p ${_pkgdir}/${_skydir}/scripts

_msg2 'installing binaries'
_skywirebins=$( ls ${srcdir}/go/bin )
for i in ${_skywirebins}; do
  _install2 ${srcdir}/go/bin/${i} ${_skybin}
done
_msg2 'installing apps'
_skywireapps=$( ls ${srcdir}/go/apps )
for i in ${_skywireapps}; do
  _install2 ${srcdir}/go/apps/${i} ${_skyapps}
done
_msg2 'installing scripts'
_skywirescripts=$( ls ${srcdir}/${_scripts}/${_pkgname} )
for i in ${_skywirescripts}; do
  _install2 ${srcdir}/${_scripts}/${_pkgname}/${i} ${_skyscripts}
done
chmod +x ${_pkgdir}/usr/bin/*
#rename visor to skywire - matche the skycoin / skycoin-cli of the skycoin wallet
[[ -f ${_pkgdir}/usr/bin/${_pkgname}-visor ]] && ln -rTsf ${_pkgdir}/usr/bin/${_pkgname}-visor ${_pkgdir}/usr/bin/${_pkgname}

#install the patched system.d services
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}.service ${_pkgdir}/${_systemddir}/${_pkgname}.service
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}-visor.service ${_pkgdir}/${_systemddir}/${_pkgname}-visor.service
}

_install2() {
_binname="${1##*/}"
_binname="${_binname%%.*}"
install -Dm755 ${1} ${_pkgdir}/${2}/${_binname}
ln -rTsf ${_pkgdir}/${2}/${_binname} ${_pkgdir}/usr/bin/${_binname}
}

_msg2() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}

_msg3() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  -->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}
