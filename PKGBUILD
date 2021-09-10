# Maintainer: Toni Tauro <eye at eyenx.ch>
pkgname=yml2dot
pkgver=0.2.0
pkgrel=1
pkgdesc="Turn YAML into beautiful Graph"
arch=('x86_64')
url="https://github.com/lucasepe/yml2dot"
license=('MIT')
source=("https://github.com/lucasepe/yml2dot/releases/download/v${pkgver}/yml2dot_${pkgver}_linux_64-bit.tar.gz")
sha256sums=('4ac84143cfe010f274f64f4c3dea903ccf903ac08137019ec651af4d46b547c8')

package() {
  install -D -m755 "$srcdir"/yml2dot "$pkgdir/usr/bin/yml2dot"
}
