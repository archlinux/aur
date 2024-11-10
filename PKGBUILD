# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=rstatusbar
pkgver=0.1.1
pkgrel=1
pkgdesc="Configurable statusbar for Xorg server using xsetroot. System info, volume, weather, date, etc."
arch=('x86_64')
url="https://github.com/javiorfo/rstatusbar"
license=('MIT')
depends=('curl' 'xorg-xsetroot')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/rstatusbar-$pkgver.tar.gz")
sha512sums=('5217bede75e106458e7944727c047715a81bf593f84692ce3f0a5fc687bdf67a61c55793508da0d2b768e4bc8f19ef3f0575a38db76c281c1d5f2bcccae38c84')
conflicts=("${pkgname}")
provides=("${pkgname}")

package() {
  cd "${pkgname}-$pkgver"
  install -Dm 755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
