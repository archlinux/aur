# Maintainer: Will R (will digi-merc.org)
# Contributors: 

pkgname=barco-clickshare
pkgver=01.07.01.79
pkgrel=1
pkgdesc="Barco ClickShare wireless presentation system software"
arch=('x86_64')
url="http://www.barco.com/en/mybarco/mysupport/productsupport/software/software-detail?nr=R33050056&rev=001007001079"
license=('proprietary')
depends=('ffmpeg-compat' 'libresample')
makedepends=('pacman>=4.2.0')
provides=("clickshare=$pkgver")
source=("https://cloud.digi-merc.org/index.php/s/rlQOpUHP6bV3968/download")
sha256sums=('04ed7e6321f1a96316ef64e548d63df38fc727d0819b21bfc67102a6af3c8949')

package() {
	tar -xf download -C "$pkgdir/"
}
# vim:set ts=2 sw=2 et:
