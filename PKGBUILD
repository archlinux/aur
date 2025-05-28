# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=rstatusbar
pkgver=0.4.0
pkgrel=1
pkgdesc="Configurable statusbar for Xorg server using xsetroot. Made in Rust with toml file configuation."
arch=('x86_64')
url="https://github.com/javiorfo/rstatusbar"
license=('MIT')
depends=('xorg-xsetroot')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/rstatusbar-$pkgver.tar.gz")
sha512sums=('a40aa995ab0198d1a33cff52e857b0f680182fb5a5e179564c088ceca4861d788fcbc6cd93f313eb5c75a11b412fc2dd86969836abb7841923ae734a22d99e73')
conflicts=("${pkgname}")
provides=("${pkgname}")

package() {
  cd "${pkgname}-$pkgver"
  install -Dm 755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
