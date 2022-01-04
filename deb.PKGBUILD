# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=cx-bin
_pkgname=cx
_projectname=skycoin
_githuborg=${_projectname}
pkgdesc="CX Blockchain Programming Language; latest binary release. skycoin.com/cx"
pkgver=0.7.1
_pkggopath="github.com/${_githuborg}/${_pkgname}"
pkgrel=7
arch=('any')
_pkgarch="amd64"
url="https://${_pkggopath}"
license=()
makedepends=('unzip')
provides=('cx')
conflicts=('cx')
#https://github.com/skycoin/cx/releases/download/v0.7.1/cx-0.7.1-bin-linux-x64.zip
source=("https://${_pkggopath}/releases/download/v${pkgver}/${_pkgname}-$pkgver-bin-linux-x64.zip")
sha256sums=('99235508f1c5f8df651f89a34e61e418d2c092f037b1210e8541cae16334f2d4')
_pkgver=${pkgver}
_pkgrel=${pkgrel}

prepare() {
  #verify PKGBUILD signature
#  gpg --verify ${srcdir}/PKGBUILD.sig ../PKGBUILD
  mkdir -p ${srcdir}/bin
  mv ${_pkgname}-${pkgver}-bin-linux-x64.zip ${srcdir}/bin/${_pkgname}-${pkgver}-bin-linux-x64.zip
  cd ${srcdir}/bin
  unzip ${_pkgname}-${pkgver}-bin-linux-x64.zip
}

build() {
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
  _msg2 'installing CX'
  options=(!strip staticlibs)
  _debpkgdir="${_pkgname}-${pkgver}-${_pkgrel}-${_pkgarch}"
  _pkgdir="${pkgdir}/${_debpkgdir}"
  mkdir -p ${_pkgdir}/
  mkdir -p ${_pkgdir}/usr/bin
  mkdir -p ${_pkgdir}/opt/${_pkgname}/bin
  install -Dm755 ${srcdir}/home/amherag/go/bin/${_pkgname} ${_pkgdir}/opt/${_pkgname}/bin/${_pkgname}
  ln -rTsf ${_pkgdir}/opt/${_pkgname}/bin/${_pkgname} ${_pkgdir}/usr/bin/${_pkgname}
  #chmod 755 ${_pkgdir}/usr/bin/${_pkgname}


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
