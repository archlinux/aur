# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Thomas Boerger <devel@ghcif.de>

pkgname=gnopaster
pkgver=0.0.9
pkgrel=2
pkgdesc="Free pastebin programm for http://nopaste.info"
arch=('any')
url="http://gnopaste.sourceforge.net/"
license=('GPL')
depends=('perl-libwww' 'perl-config-simple')
source=(http://nopaste.info/apps/$pkgname-$pkgver.pl.gz)
md5sums=('f4dc2382fb96feb8894f1f8c346c5987')

package() {
  cd "${srcdir}"
  install -Dm755 ${pkgname}-${pkgver}.pl "${pkgdir}"/usr/bin/${pkgname}
}
