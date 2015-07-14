# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>

pkgname=debian-keyring
pkgver=2013.12.13
pkgrel=1
pkgdesc="GnuPG keys of the Ubuntu archive"
arch=('any')
url='http://keyring.debian.org/'
license=('GPL')
depends=('gnupg')

source=("http://ftp.de.debian.org/debian/pool/main/d/debian-keyring/${pkgname}_${pkgver}_all.deb")
sha256sums=('3649263fe61d970c58d46e930a5ffb03a01f3ca2d2c634862693b0e20fbe4782')

package() {
  bsdtar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
