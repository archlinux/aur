# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=code-server
pkgver=1.32.0_282
pkgrel=1
pkgdesc="Run VS Code on a remote server"
arch=('x86_64')
url="https://github.com/codercom/code-server"
license=(MIT)
source=(https://github.com/codercom/code-server/releases/download/${pkgver//_/-}/code-server-${pkgver//_/-}-linux-x64.tar.gz)
sha512sums=(SKIP)
options=('!strip')

package() {
  cd "$srcdir/code-server-${pkgver//_/-}-linux-x64"

  install -Dm755 code-server "$pkgdir"/usr/bin/code-server
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
