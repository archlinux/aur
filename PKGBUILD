# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=bitsmuggler
pkgbin=bitsmuggler
pkgver=v0.1.0
pkgrel=2
pkgdesc="TUI app to download YTS movies and opensubtitles subs"
arch=('x86_64')
url="https://github.com/javiorfo/bitsmuggler"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/bitsmuggler-$pkgver.tar.gz")
sha512sums=('47aa5190ae79c4220ee6cf37b6c6c6fafab76033744cffef98b4e482a0a60a3b51894ac4c90da55c7a0b878f4fc7cf31656e442d8a100e11ae3f00539ee97b4e')
conflicts=("${pkgname}")
provides=("${pkgname}")

package() {
  cd "${pkgname}-$pkgver"
  install -Dm 755 "${pkgbin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}

