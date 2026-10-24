# Maintainer: AzureHound <183492338+AzureHound@users.noreply.github.com>
pkgname=jelly
pkgver=3.5.2
pkgrel=1
pkgdesc="🪼 Explore & Stream Jellyfin via CLI"
arch=('any')
url="https://github.com/AzureHound/jelly"
license=('0BSD')
depends=('chafa' 'curl' 'fzf' 'jq' 'mpv' 'socat')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AzureHound/jelly/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ccf563c35b178711a3a5c4f1e16b573fd4f3e7e0bcf2a9ed375e182d1d69f1f0')

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
