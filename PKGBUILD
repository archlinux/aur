# Maintainer: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=debian-keyring
pkgver=2017.03.16
pkgrel=1
pkgdesc="GnuPG keys for Debian (non-archive)"
arch=('any')
url='http://keyring.debian.org/'
license=('GPL')
depends=('gnupg')

source=("http://httpredir.debian.org/debian/pool/main/d/debian-keyring/${pkgname}_${pkgver}_all.deb")
sha256sums=('302215454f3254143550db47810eb794f25781dbe6c21c104a937657a8db73d1')

package() {
  bsdtar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
