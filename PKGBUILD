# Maintainer: Martynas Mickevičius <self at 2m dot lt>
pkgname=ucm-bin
pkgver=M1i
pkgrel=4
pkgdesc='Unison language code manager'
arch=('x86_64')
url='https://www.unisonweb.org'
license=('custom')
depends=('ncurses5-compat-libs' 'gmp' 'zlib')

source=("ucm-$pkgver::https://github.com/unisonweb/unison/releases/download/release/$pkgver/unison-linux64.tar.gz"
        "https://raw.githubusercontent.com/unisonweb/unison/release/$pkgver/LICENSE")
sha256sums=('d0ab582069466c304b29e72b54df62a9d3165d72d080bcec6625b0cde829ed0b'
            '6dd1702f5e06317fef9577559ff85dae2aba622b0bc66f18db88c66ffeb693a2')

package() {
  install -D -m755 ucm "$pkgdir/usr/bin/ucm"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
