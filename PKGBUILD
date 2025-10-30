# Maintainer: AzureHound <183492338+AzureHound@users.noreply.github.com>
pkgname=jelly
pkgver=3.4.1
pkgrel=1
pkgdesc="🪼 Explore & Stream Jellyfin via CLI"
arch=('any')
url="https://github.com/AzureHound/jelly"
license=('0BSD')
depends=('awk' 'bash' 'chafa' 'curl' 'fzf' 'grep' 'jq' 'mpv' 'socat')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AzureHound/jelly/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('447d080b08f51ac9738d59715489172c5338f77a1b0d5ecc043fb0c575aaaaa9')

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
