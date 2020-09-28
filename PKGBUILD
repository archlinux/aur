# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=ssh-audit
pkgver=2.3.0
pkgrel=1
pkgdesc="A tool for ssh server auditing."
arch=(any)
url="https://github.com/jtesta/ssh-audit"
license=('MIT')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jtesta/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('86dd949d24c0fd7612d99f615028c68d483d681509f34b196916d2f27fa6e144cc5ebe559043466fc78fdec1dd57f3deba7139cf856478b07514eaa3f9a31327')

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 ssh-audit.py "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
