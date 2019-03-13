# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=code-server
pkgver=1.32.0_245
pkgrel=5
pkgdesc="Run VS Code on a remote server"
arch=('x86_64')
url="https://github.com/codercom/code-server"
license=(MIT)
source=(https://github.com/codercom/code-server/releases/download/${pkgver//_/-}/code-server-${pkgver//_/-}-linux-x64.tar.gz)
sha512sums=('dff9e1288a71f3f295f6d767665214487a33223548f4cde4b04acf701b8154fac827d29ceaefe9182ed020afe758d7592d29755d1960641832afb08ad0b2c3ee')

package() {
  cd "$srcdir/code-server-${pkgver//_/-}-linux-x64"

  install -Dm755 code-server "$pkgdir"/usr/bin/code-server
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
