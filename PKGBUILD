# Maintainer: Martynas Mickevičius <self at 2m dot lt>
pkgname=ucm-bin
pkgver=M4
pkgrel=1
pkgdesc='Unison language code manager'
arch=('x86_64')
url='https://www.unison-lang.org/'
license=('custom')
depends=('gmp' 'zlib')

source=("ucm-$pkgver::https://github.com/unisonweb/unison/releases/download/release%2F$pkgver/ucm-linux.tar.gz"
        "https://raw.githubusercontent.com/unisonweb/unison/release/$pkgver/LICENSE")
sha256sums=('3aab4988a02c79fc367d58e1b6c6147bea8b3ea5c13c590751a321dba109049e'
            'b509f7dd073911b831418b6f6f654d16c43abd0fac5c9f12402873ec08849fa4')

package() {
  install -D -m755 ucm "$pkgdir/usr/bin/ucm"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
