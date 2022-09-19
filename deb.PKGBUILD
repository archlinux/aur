# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgname=skywire-dmsg
_pkgname=dmsg
_githuborg=skycoin
pkgdesc="Skywire Mainnet Node implementation. Skycoin.com"
pkgver='0.0.1'
_pkgver=${pkgver}
pkgrel=1
_pkgrel=${pkgrel}
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' )
_pkgarch=$(dpkg --print-architecture)
_pkggopath="github.com/${_githuborg}/${_pkgname}"
url="https://${_pkggopath}"
license=()
makedepends=('git' 'go' 'musl' 'kernel-headers-musl' 'dpkg')
source=("git+${url}.git#branch=${BRANCH:-develop}")
sha256sums=('SKIP')

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
export CGO_ENABLED=1
#use musl-gcc for static compilation
export CC=musl-gcc

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

### CONTROL FILES CREATION ###
#create control file for the debian package
echo "Package: ${_pkgname}" > ${srcdir}/control
echo "Version: ${_pkgver}-${_pkgrel}" >> ${srcdir}/control
echo "Priority: optional" >> ${srcdir}/control
echo "Section: web" >> ${srcdir}/control
echo "Architecture: ${_pkgarch}" >> ${srcdir}/control
echo "Depends: ${_debdeps}" >> ${srcdir}/control
echo "Maintainer: Moses Narrow" >> ${srcdir}/control
echo "Description: ${pkgdesc}" >> ${srcdir}/control

}

package() {
_debpkgdir="${_pkgname}-${pkgver}-${_pkgrel}-${_pkgarch}"
_pkgdir="${pkgdir}/${_debpkgdir}"
mkdir -p ${_pkgdir}/
_msg2 'installing binaries'
mkdir -p ${_pkgdir}/opt/dmsg/bin/
mkdir -p ${_pkgdir}/usr/bin/

for _i in $GOBIN/* ; do
install -Dm755  $_i ${_pkgdir}/opt/dmsg/bin/
done
for _i in ${_pkgdir}/opt/dmsg/bin/* ; do
ln -rTsf ${_i} ${_pkgdir}/usr/bin/${_i##*\/}
done
_msg2 'installing control file'
install -Dm755 ${srcdir}/control ${_pkgdir}/DEBIAN/control

_msg2 'creating the debian package'
#create the debian package
cd $pkgdir
dpkg-deb --build -z9 ${_debpkgdir}
mv *.deb ../../
#exit so the arch package doesn't get built
exit
}

_msg2() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}
