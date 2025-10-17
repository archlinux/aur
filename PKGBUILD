# Maintainer: savew (savew@savew.dev)

pkgname=ffetch
pkgver=0.2.20
pkgrel=1
pkgdesc='CLI tool to fetch system info.'
url='https://github.com/0l3d/ffetch'
license=('GPL3')
arch=('x86_64')
depends=('pciutils' 'xorg-xprop' 'coreutils')
source=("$url/releases/download/v$pkgver/ffetch-v$pkgver-linux-x86_64.tar.gz")
sha256sums=('a1c772b2e6aff352c64e4eea24f2a81f9efd1cedb22bd6b06ffd9e6bf36f87fa')

package() {
  tar -xzf "$srcdir/ffetch-v$pkgver-linux-x86_64.tar.gz" -C "$srcdir"
  install -Dm755 "$srcdir/ffetch" "$pkgdir/usr/bin/ffetch"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
