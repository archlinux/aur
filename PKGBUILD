# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=hivemind-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="Hivemind is a process manager for Procfile-based applications."
arch=("x86_64")
url="https://github.com/DarthSim/hivemind"
license=("MIT")
provides=("hivemind")
conflicts=("hivemind" "hivemind-git")
source=("$pkgname-$pkgver.gz::$url/releases/download/v$pkgver/hivemind-v$pkgver-linux-amd64.gz")
md5sums=("d638b5ecb36fbc5c2a1b6f8660d5c24e")

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/$pkgname/hivemind"
  install -d "$pkgdir/usr/bin" && ln -s "/opt/$pkgname/hivemind" "$_/hivemind"
}
