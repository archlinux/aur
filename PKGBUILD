# Maintainer: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=debian-keyring
pkgver=2016.09.04
pkgrel=1
pkgdesc="GnuPG keys for Debian (non-archive)"
arch=('any')
url='http://keyring.debian.org/'
license=('GPL')
depends=('gnupg')

source=("http://httpredir.debian.org/debian/pool/main/d/debian-keyring/${pkgname}_${pkgver}_all.deb")
sha256sums=('dec4c9faa1e4f385d3d10609597f47bd893e33d052118a66c693bcfd72855aae')

package() {
  bsdtar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
