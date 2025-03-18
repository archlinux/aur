# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=bitsmuggler
pkgbin=bitsmuggler
pkgver=v0.1.0
pkgrel=1
pkgdesc="TUI app to download YTS movies and opensubtitles subs"
arch=('x86_64')
url="https://github.com/javiorfo/bitsmuggler"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/bitsmuggler-$pkgver.tar.gz")
sha512sums=('f5ca3db82688542d92c3bc5767df4c2ed51773385b81f05406a1db73731fc2554cbcea8b319caf753351deb9a0e22663a88012861b799a9417793dcccbda15a4')
conflicts=("${pkgname}")
provides=("${pkgname}")

package() {
  cd "${pkgname}-$pkgver"
  install -Dm 755 "${pkgbin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}

