# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=cx
_pkgname=$pkgname
_projectname=skycoin
_githuborg=$_projectname
pkgdesc="CX Blockchain Programming Language. skycoin.com/cx"
pkgver=0.8.0
_pkggopath="github.com/${_githuborg}/${_pkgname}"
_pkggopath1="github.com/SkycoinProject/${_pkgname}"
pkgrel=1
arch=('i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm')
url="https://${_pkggopath}"
license=()
makedepends=('git' 'go' 'gcc' 'glade' 'xorg-server-xvfb' 'libxinerama' 'libxcursor' 'libxrandr' 'libglvnd' 'libglade' 'mesa' 'libxi' 'cairo' 'perl' 'pango' 'goyacc' 'musl' 'kernel-headers-musl' 'dpkg')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e7f56b9439accbec8ab4d314548c84e529086bf0f06e132a7ebee296e8fd2bcc')
_pkgname=${pkgname}
_pkgver=${pkgver}
_pkgrel=${pkgrel}



prepare() {
  # https://wiki.archlinux.org/index.php/Go_package_guidelines
  mkdir -p ${srcdir}/go/src/${_pkggopath1//${_pkgname}/} ${srcdir}/go/bin
  ln -rTsf ${srcdir}/${_pkgname}-${pkgver} ${srcdir}/go/src/${_pkggopath1}
  #cd ${srcdir}/go/src/${_pkggopath}/
	}

build() {
    export GOPATH=${srcdir}/go
  export GOBIN=${GOPATH}/bin
  export CC=musl-gcc
	#  cp -b Makefile ${srcdir}/go/src/${_pkggopath}/Makefile
  cd ${srcdir}/go/src/${_pkggopath1}
	_cmddir=${srcdir}/go/src/${_pkggopath1}/cmd
  #static compilation
  _msg2 'building cx binary'
  cd ${srcdir}/go/src/${_pkggopath1}/cmd/cx
  go build -tags="ptr32 cipher cxfx cxos http regexp" -trimpath --ldflags '-linkmode external -extldflags "-static" -buildid=' -o $GOBIN/ .
  cd $GOBIN
  msg2 'binary sha256sums'
  sha256sum $(ls)

  ### CONTROL FILES CREATION ###
  #create control file for the debian package
  echo "Package: ${_pkgname}" > ${srcdir}/control
  echo "Version: ${_pkgver}-${_pkgrel}" >> ${srcdir}/control
  echo "Priority: optional" >> ${srcdir}/control
  echo "Section: web" >> ${srcdir}/control
  echo "Architecture: ${_pkgarch}" >> ${srcdir}/control
  [[ -z ${_debdeps} ]] && echo "Depends: ${_debdeps}" >> ${srcdir}/control
  echo "Maintainer: Moses Narrow" >> ${srcdir}/control
  echo "Description: ${pkgdesc}" >> ${srcdir}/control

}

package() {
  options=(!strip staticlibs)
  _debpkgdir="${_pkgname}-${pkgver}-${_pkgrel}-${_pkgarch}"
  _pkgdir="${pkgdir}/${_debpkgdir}"
  mkdir -p ${_pkgdir}/
	#make dirs
	mkdir -p ${_pkgdir}/usr/bin
	mkdir -p ${_pkgdir}/opt/${_pkgname}/
	install -Dm755 ${srcdir}/go/bin/${_pkgname} ${_pkgdir}/opt/${_pkgname}/bin/${_pkgname}
	ln -rTsf ${_pkgdir}/opt/${_pkgname}/bin/${_pkgname} ${_pkgdir}/usr/bin/${_pkgname}
	chmod 755 ${_pkgdir}/usr/bin/${_pkgname}

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
