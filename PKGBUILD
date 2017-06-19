# Maintainer: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=debian-keyring
pkgver=2017.05.28
pkgrel=1
pkgdesc="GnuPG keys for Debian (non-archive)"
arch=('any')
url='http://keyring.debian.org/'
license=('GPL')
depends=('gnupg')

source=("http://httpredir.debian.org/debian/pool/main/d/debian-keyring/${pkgname}_${pkgver}_all.deb")
sha256sums=('2d43b866907dec296edf27c0e756daf5eba196370d6fbe37fc3852cdc4a12da2')

package() {
  bsdtar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
