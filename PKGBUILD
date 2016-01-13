# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>

pkgname=debian-keyring
pkgver=2015.11.30
pkgrel=1
pkgdesc="GnuPG keys of the Ubuntu archive"
arch=('any')
url='http://keyring.debian.org/'
license=('GPL')
depends=('gnupg')

source=("http://ftp.de.debian.org/debian/pool/main/d/debian-keyring/${pkgname}_${pkgver}_all.deb")
sha256sums=('8007a046bf560de8787646f70302598bfd7243c7eb28624140b8e558c1309b1b')

package() {
  bsdtar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
