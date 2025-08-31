# Maintainer: savew

pkgname=ffetch-bin
pkgver=0.2.15
pkgrel=1
pkgdesc='CLI tool to fetch system info.'
url='https://github.com/0l3d/ffetch'
license=('GPL3')
arch=('x86_64')
depends=('pciutils' 'xorg-xprop' 'coreutils')
source=("$url/releases/download/v$pkgver/ffetch-v$pkgver-linux-x86_64.tar.gz")
sha256sums=('bd0a1756c36f4ae7ad5010f7392f5229c3fdb7235da60af600b4c3f4e0d263f6')

package() {
  tar -xzf "$srcdir/ffetch-v$pkgver-linux-x86_64.tar.gz" -C "$srcdir"
  install -Dm755 "$srcdir/ffetch" "$pkgdir/usr/bin/ffetch"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
