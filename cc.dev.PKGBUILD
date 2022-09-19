# Maintainer: Moses Narrow <moses@skycoin.com>
_projectname=skycoin
pkgname=dmsg
_pkgname=${pkgname/-bin/}
_githuborg=${_projectname}
pkgdesc="Skywire Mainnet Node implementation; develop branch - Debian testing package."
_pkggopath="github.com/${_githuborg}/${_pkgname}"
pkgver='0.0.1'
pkgrel=1
#pkgrel=1
_pkgarch=$(dpkg --print-architecture)
_pkgarches=('armhf' 'arm64' 'amd64' 'armel')
_pkgver=${pkgver}
_pkgrel=${pkgrel}
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' )
url="https://${_pkggopath}"
license=('license-free')
makedepends=('dpkg' 'git' 'go' 'musl' 'kernel-headers-musl' 'aarch64-linux-musl' 'arm-linux-gnueabihf-musl')
depends=()
_debdeps=""
source=("git+${url}.git#branch=develop"
)
sha256sums=('SKIP')

prepare() {
for _i in ${_pkgarches[@]}; do
_msg2 "$_i"
done
# https://wiki.archlinux.org/index.php/Go_package_guidelines
mkdir -p ${srcdir}/go/src/github.com/${_githuborg}/
for _i in ${_pkgarches[@]}; do
mkdir -p ${srcdir}/go/bin.${_i}
mkdir -p ${srcdir}/go/apps.${_i}
done
ln -rTsf ${srcdir}/${_pkgname} ${srcdir}/go/src/${_pkggopath}
cd ${srcdir}/go/src/${_pkggopath}/
}

build() {
export GOPATH=${srcdir}/go
export GOOS=linux
export CGO_ENABLED=1  #default anyways

local _version="${pkgver}"
DMSG_BASE="github.com/skycoin/dmsg"
BUILDINFO_PATH="${DMSG_BASE}/buildinfo"
BUILDINFO_VERSION="${BUILDINFO_PATH}.version=${_version}"
BUILDINFO=${BUILDINFO_VERSION} ${BUILDINFO_DATE} ${BUILDINFO_COMMIT}
#use musl-gcc for static compilation
for _i in ${_pkgarches[@]}; do
msg2 "_pkgarch=$_i"
local _pkgarch=$_i
export GOBIN=${GOPATH}/bin.${_pkgarch}
export _GOAPPS=${GOPATH}/apps.${_pkgarch}
export GOOS=linux
#static cross-compilation
[[ $_pkgarch == "amd64" ]] && export GOARCH=amd64 && export CC=musl-gcc
[[ $_pkgarch == "arm64" ]] && export GOARCH=arm64 && export CC=aarch64-linux-musl-gcc
[[ $_pkgarch == "armhf" ]] && export GOARCH=arm && export GOARM=6 && export CC=arm-linux-gnueabihf-musl-gcc
[[ $_pkgarch == "armel" ]] && export GOARCH=arm && export GOARM=5 && export CC=arm-linux-gnueabihf-musl-gcc
#_ldflags=('-linkmode external -extldflags "-static" -buildid=')
#create the skywire binaries

#create the skywire binaries
cd ${srcdir}/go/src/${_pkggopath}
go mod tidy
go mod vendor

_cmddir=${srcdir}/go/src/${_pkggopath}/cmd
for _i in ${_cmddir}/*/*.go ; do
	_dir=${_i/*skycoin\/dmsg\/}
	_dir=${_dir%\/*}
	cd $_dir
	#temporary fix
	if [[ $_i == *"dmsg-discovery"* ]] ; then
	go get github.com/VictoriaMetrics/metrics
	go get github.com/go-chi/chi/v5
	go get github.com/go-chi/chi/v5/middleware
	go get github.com/go-redis/redis/v8
	go get github.com/json-iterator/go
	go get github.com/pires/go-proxyproto
	go get github.com/sirupsen/logrus
	go get github.com/skycoin/noise
	go get github.com/skycoin/skycoin/src/cipher
	go get github.com/skycoin/skywire-utilities/pkg/buildinfo
	go get github.com/skycoin/skywire-utilities/pkg/cipher
	go get github.com/skycoin/skywire-utilities/pkg/cmdutil
	go get github.com/skycoin/skywire-utilities/pkg/httputil
	go get github.com/skycoin/skywire-utilities/pkg/logging
	go get github.com/skycoin/skywire-utilities/pkg/metricsutil
	go get github.com/skycoin/skywire-utilities/pkg/netutil
	go get github.com/skycoin/skywire-utilities/pkg/networkmonitor
	go get github.com/skycoin/skywire-utilities/pkg/skyenv
	go get github.com/skycoin/yamux
	go get github.com/spf13/cobra
	go get github.com/skycoin/dmsg/internal/dmsg-discovery/store
	fi
	if [[ $_i == *"dmsgpty-cli"* ]] ; then
	go get github.com/skycoin/dmsg/pkg/dmsgpty
	go get golang.org/x/term@v0.0.0-20210927222741-03fcf44c2211
	go get github.com/skycoin/skywire/pkg/skyenv
	go get nhooyr.io/websocket
	go get github.com/VictoriaMetrics/metrics
	go get github.com/go-chi/chi/v5
	go get github.com/go-chi/chi/v5/middleware
	go get github.com/go-redis/redis/v8
	go get github.com/json-iterator/go
	go get github.com/pires/go-proxyproto
	go get github.com/sirupsen/logrus
	go get github.com/skycoin/noise
	go get github.com/skycoin/skycoin/src/cipher
	go get github.com/skycoin/skywire-utilities/pkg/buildinfo
	go get github.com/skycoin/skywire-utilities/pkg/cipher
	go get github.com/skycoin/skywire-utilities/pkg/cmdutil
	go get github.com/skycoin/skywire-utilities/pkg/httputil
	go get github.com/skycoin/skywire-utilities/pkg/logging
	go get github.com/skycoin/skywire-utilities/pkg/metricsutil
	go get github.com/skycoin/skywire-utilities/pkg/netutil
	go get github.com/skycoin/skywire-utilities/pkg/networkmonitor
	go get github.com/skycoin/skywire-utilities/pkg/skyenv
	go get github.com/skycoin/yamux
	go get github.com/spf13/cobra
	fi
	go build -trimpath --ldflags '-s -w -linkmode external -extldflags "-static" -buildid=' -o $GOBIN/ .
	cd ../../
done

#binary transparency
cd $GOBIN
_msg2 'binary sha256sums'
echo -e "$_pkgarch"
sha256sum $(ls)

_msg2 'creating the DEBIAN/control files'
#create control file for the debian package
#this is not actually a binary release but is used for pre-release testing, so must have the same name
echo "Package: ${_pkgname}" > ${srcdir}/${_pkgarch}.control
echo "Version: ${_pkgver}-${_pkgrel}" >> ${srcdir}/${_pkgarch}.control
echo "Priority: optional" >> ${srcdir}/${_pkgarch}.control
echo "Section: web" >> ${srcdir}/${_pkgarch}.control
echo "Architecture: ${_pkgarch}" >> ${srcdir}/${_pkgarch}.control
echo "Depends: ${_debdeps}" >> ${srcdir}/${_pkgarch}.control
echo "Maintainer: github.com/skycoin" >> ${srcdir}/${_pkgarch}.control
echo "Description: ${pkgdesc}" >> ${srcdir}/${_pkgarch}.control
 done
}

package() {
for _i in ${_pkgarches[@]}; do
msg2 "_pkgarch=${_i}"
local _pkgarch=${_i}
GOPATH=${srcdir}/go
GOBIN=${GOPATH}/bin.${_pkgarch}
_msg2 'creating dirs'
#set up to create a .deb package
_debpkgdir="${_pkgname}-bin-${pkgver}-${_pkgrel}-${_pkgarch}"
_pkgdir="${pkgdir}/${_debpkgdir}"
_skydir="opt/${_pkgname}"
_skybin="${_skydir}/bin"
[[ -d ${_pkgdir} ]] && rm -rf ${_pkgdir}
mkdir -p ${_pkgdir}/usr/bin
mkdir -p ${_pkgdir}/${_skydir}/bin

cd $_pkgdir
_msg2 'installing binaries'
 install -Dm755 ${GOBIN}/* ${_pkgdir}/${_skybin}/
for _j in ${_pkgdir}/${_skybin}/* ; do
	ln -rTsf ${_j} ${_pkgdir}/usr/bin/${_j##*/}
done

_msg2 'installing control file and install scripts'
install -Dm755 ${srcdir}/${_pkgarch}.control ${_pkgdir}/DEBIAN/control
#install -Dm755 ${srcdir}/${_scripts}/preinst.sh ${_pkgdir}/DEBIAN/preinst
#install -Dm755 ${srcdir}/postinst.sh ${_pkgdir}/DEBIAN/postinst
#install -Dm755 ${srcdir}/prerm.sh ${_pkgdir}/DEBIAN/prerm
#install -Dm755 ${srcdir}/${_scripts}/postrm.sh ${_pkgdir}/DEBIAN/postrm

_msg2 'creating the debian package'
#create the debian package
cd $pkgdir
dpkg-deb --build -z9 ${_debpkgdir}
mv *.deb ../../
done
#exit so the arch package doesn't get built
exit
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
