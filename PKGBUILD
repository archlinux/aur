# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=passcualito
pkgbin=passc
pkgver=v0.1.1
pkgrel=1
pkgdesc="Simple Command-Line Password Manager for Linux"
arch=('x86_64')
url="https://github.com/javiorfo/passcualito"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/passcualito-$pkgver.tar.gz")
sha512sums=('e99e1bf05dc240a221b1df78e9337addf8c8f51bbe47066190a6f3a26ffeda0c9f2451516b4ef97ce105624ce8507dc537bc94341edf53af35321f0201b46dc7')
conflicts=("${pkgname}")
provides=("${pkgname}")

package() {
  cd "${pkgname}-$pkgver"
  install -Dm 755 "${pkgbin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
