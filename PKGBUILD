# Maintainer: Toni Tauro <eye at eyenx.ch>
pkgname=yml2dot
pkgver=0.1.0
pkgrel=1
pkgdesc="Turn YAML into beautiful Graph"
arch=('x86_64')
url="https://github.com/lucasepe/yml2dot"
license=('MIT')
source=("https://github.com/lucasepe/yml2dot/releases/download/v${pkgver}/yml2dot_${pkgver}_linux_64-bit.tar.gz")
sha256sums=('faa30f244c3d4b695d16fb7481d58bbc50f4b84842338952ae1e72c79d7c461b')

package() {
  install -D -m755 "$srcdir"/yml2dot "$pkgdir/usr/bin/yml2dot"
}
