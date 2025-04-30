# Maintainer: AzureHound <183492338+AzureHound@users.noreply.github.com>
pkgname=jelly
pkgver=1.0.0
pkgrel=1
pkgdesc="Explore & stream Jellyfin from the terminal! 🚀"
arch=('x86_64' 'armv7h') # Specify supported architectures
url="https://github.com/AzureHound/jelly"
license=('0BSD')
depends=('bash' 'curl' 'jq' 'fzf' 'mpv') # Runtime dependencies
source=("$pkgname-$pkgver.tar.gz::https://github.com/AzureHound/jelly/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('28249a763b045619b1daac79000db5dfdde1205cb60000a590e7c26a4baf75b7')

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
