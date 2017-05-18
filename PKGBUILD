# Maintainer: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=debian-keyring
pkgver=2017.05.09
pkgrel=1
pkgdesc="GnuPG keys for Debian (non-archive)"
arch=('any')
url='http://keyring.debian.org/'
license=('GPL')
depends=('gnupg')

source=("http://httpredir.debian.org/debian/pool/main/d/debian-keyring/${pkgname}_${pkgver}_all.deb")
sha256sums=('b2728b93265f9fceb13f9ea62f95bee46cab0ae767c398dfb80ca4c79df85bc8')

package() {
  bsdtar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
