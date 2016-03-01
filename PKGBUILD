# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>

pkgname=debian-keyring
pkgver=2016.01.20
pkgrel=1
pkgdesc="GnuPG keys of the Ubuntu archive"
arch=('any')
url='http://keyring.debian.org/'
license=('GPL')
depends=('gnupg')

source=("http://ftp.de.debian.org/debian/pool/main/d/debian-keyring/${pkgname}_${pkgver}_all.deb")
sha256sums=('12f0661a4d7a99157f21010c3eea3677bad1d1c553a30cc4160cdcc974121f3b')

package() {
  bsdtar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
