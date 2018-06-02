# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=folder-color-switcher
pkgver=1.2.3
pkgrel=1
pkgdesc="Folder color switcher for Nemo and Caja"
arch=('any')
url="https://github.com/linuxmint/folder-color-switcher"
license=('GPL')
optdepends=('nemo-python: Nemo extension'
            'python2-caja: Caja extension')
options=('!libtool' '!emptydirs')

source=("${pkgname}-${pkgver}.tar.gz::http://packages.linuxmint.com/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver}.tar.gz")
sha256sums=('8b882aad2af32ccc3725ca4dfffed6bfe49551bac9a14abff1428ab77a142beb')

build() {
  cd ${srcdir}/${pkgname}
  make
}

package() {
  cd ${srcdir}/${pkgname}
  cp -r usr "${pkgdir}"
}
