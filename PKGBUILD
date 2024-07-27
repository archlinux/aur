# Maintainer: kryksyh <kryksyh@gmail.com>
pkgnamebase=ttynt
pkgname=$pkgnamebase-bin
pkgver=0.0.1
pkgrel=1
pkgdesc='A command-line tool for coloring and highlighting text in the terminal based on regex patterns'
arch=(x86_64)
url="https://github.com/kryksyh/$pkgnamebase"
license=(MIT)
source=("$url/releases/download/v$pkgver/$pkgnamebase-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
depends=()
conflicts=('ttynt')
provides=('ttynt')
sha512sums=('c89463e7d30d15fe2a9aeab34099401d42499ed6f568c1c85dea824cf90ec0f4c5fbac040b60e535fb56c70fe01dd7c25fd926f9e8008c0f0487ee01f0bf56eb')

package() {
  cd "$srcdir/$pkgnamebase-v$pkgver-x86_64-unknown-linux-gnu"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgnamebase/LICENSE"
  install -Dm755 $pkgnamebase "${pkgdir}/usr/bin/$pkgnamebase"
}
