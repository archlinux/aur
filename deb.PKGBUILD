# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=skywire-dmsg
_pkgname=dmsg
_githuborg=skycoin
pkgdesc="Skywire Mainnet Node implementation. Skycoin.com"
pkgver=0.6.0
_pkgver=${pkgver}
pkgrel=4
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
_cmddir=${srcdir}/go/src/${_pkggopath}/cmd

_buildbins dmsg-discovery $GOBIN
_buildbins dmsg-server $GOBIN
_buildbins dmsgget $GOBIN
_buildbins dmsgpty-cli $GOBIN
_buildbins dmsgpty-host $GOBIN
_buildbins dmsgpty-ui $GOBIN

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

_buildbins() {
  _GOHERE=$2
  _binpath=$3
  _binname=$1
  _msg2 "building ${_binname} binary"
  cd ${_cmddir}/${_binpath}${_binname}
  go build -trimpath --ldflags '-s -w -linkmode external -extldflags "-static" -buildid=' -o $_GOHERE/ .
}

package() {
  _debpkgdir="${_pkgname}-${pkgver}-${_pkgrel}-${_pkgarch}"
  echo "${_debpkgdir}"
  _pkgdir="${pkgdir}/${_debpkgdir}"
  mkdir -p ${_pkgdir}/
  #create directory trees
	_srcdir=${srcdir}/${_pkgname}
  _path=${_pkgdir}/opt/${_pkgname}
  _gobin=${_path}/bin
	mkdir -p ${_pkgdir}/usr/bin
	mkdir -p ${_gobin}
	mkdir -p ${_guidir}
	_msg2 'installing binaries'
	_bin="${srcdir}"/go/bin
	_bins=$( ls "$_bin")
	for i in $_bins; do
		install -Dm755 ${srcdir}/go/bin/${i} ${_gobin}/${i}
		ln -rTsf ${_gobin}/$i ${_pkgdir}/usr/bin/${i}
		chmod 755 ${_pkgdir}/usr/bin/${i}
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
