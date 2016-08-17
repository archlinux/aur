# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>

pkgname=debian-keyring
pkgver=2016.08.10
pkgrel=1
pkgdesc="GnuPG keys for Debian (non-archive)"
arch=('any')
url='http://keyring.debian.org/'
license=('GPL')
depends=('gnupg')

source=("http://ftp.de.debian.org/debian/pool/main/d/debian-keyring/${pkgname}_${pkgver}_all.deb")
sha256sums=('1966bb5bf598d049a36352ef75acf5778ea4ca9357155e9399cee3c1b401feb6')

package() {
  bsdtar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
