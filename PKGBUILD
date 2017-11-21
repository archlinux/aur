# Maintainer: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=debian-keyring
pkgver=2017.08.28
pkgrel=1
pkgdesc="GnuPG keys for Debian (non-archive)"
arch=('any')
url='http://keyring.debian.org/'
license=('GPL')
depends=('gnupg')

source=("http://httpredir.debian.org/debian/pool/main/d/debian-keyring/${pkgname}_${pkgver}_all.deb")
sha256sums=('0989f69c2d0c1d9628ff1179f179b9407d5c9c48fa69a2236adad7433f16f634')

package() {
  bsdtar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
