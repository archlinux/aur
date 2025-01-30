# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=passcualito
pkgbin=passc
pkgver=v0.1.0
pkgrel=1
pkgdesc="Simple Command-Line Password Manager for Linux"
arch=('x86_64')
url="https://github.com/javiorfo/passcualito"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/passcualito-$pkgver.tar.gz")
sha512sums=('3dd9ba05f24b83be58b0a91a67ae73a63052f38b970362812351a037b8452c22a9ed0497bfa8dd0e6829af58b68d9f89c4171799116acc2932a72486157d8055')
conflicts=("${pkgname}")
provides=("${pkgname}")

package() {
  cd "${pkgname}-$pkgver"
  install -Dm 755 "${pkgbin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
