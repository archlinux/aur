# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=code-server
pkgver=1.32.0_275
pkgrel=0
pkgdesc="Run VS Code on a remote server"
arch=('x86_64')
url="https://github.com/codercom/code-server"
license=(MIT)
source=(https://github.com/codercom/code-server/releases/download/${pkgver//_/-}/code-server-${pkgver//_/-}-linux-x64.tar.gz)
sha512sums=('e4f255ffbb8b1ba6043e6d2b53ded6587c86ae9b80f9b78ee7ba9bd76a6889793650982ca2240e1553490063d504b16b36015f6b042fb58f3685058776027959')
options=('!strip')

package() {
  cd "$srcdir/code-server-${pkgver//_/-}-linux-x64"

  install -Dm755 code-server "$pkgdir"/usr/bin/code-server
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
