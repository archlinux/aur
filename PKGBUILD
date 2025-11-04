# Maintainer: AzureHound <183492338+AzureHound@users.noreply.github.com>
pkgname=jelly
pkgver=3.5.0
pkgrel=1
pkgdesc="🪼 Explore & Stream Jellyfin via CLI"
arch=('any')
url="https://github.com/AzureHound/jelly"
license=('0BSD')
depends=('chafa' 'curl' 'fzf' 'jq' 'mpv' 'socat')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AzureHound/jelly/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('91fa2003313497f4cbadf8f47893f20f8a5518036a0ce756309b444923ec1432')

build() {
  cd "$srcdir/$pkgname-$pkgver"
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  # app
  install -Dm755 src/jelly "$pkgdir/usr/bin/jelly"
  # docs
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
