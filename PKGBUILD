# Maintainer: AzureHound <183492338+AzureHound@users.noreply.github.com>
pkgname=jelly
pkgver=2.0.1
pkgrel=1
pkgdesc="Explore & stream Jellyfin from terminal! 🪼"
arch=('x86_64' 'armv7h') # Specify supported architectures
url="https://github.com/AzureHound/jelly"
license=('0BSD')
depends=('bash' 'curl' 'jq' 'fzf' 'mpv' 'yajl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AzureHound/jelly/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # Add any build steps here, if necessary
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  # Run tests here (if applicable)
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  # Install the main script
  install -Dm755 jelly "$pkgdir/usr/bin/jelly"
  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
