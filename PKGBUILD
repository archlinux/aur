# Maintainer: Martynas Mickevičius <self at 2m dot lt>
pkgname=ucm-bin
pkgver=M2j
pkgrel=1
pkgdesc='Unison language code manager'
arch=('x86_64')
url='https://www.unisonweb.org'
license=('custom')
depends=('ncurses5-compat-libs' 'gmp' 'zlib')

source=("ucm-$pkgver::https://github.com/unisonweb/unison/releases/download/release/$pkgver/ucm-linux.tar.gz"
        "https://raw.githubusercontent.com/unisonweb/unison/release/$pkgver/LICENSE")
sha256sums=('a950c6106c71c483fd3c890b081957d24662edda03cba8219391cb4973b07163'
            '6dd1702f5e06317fef9577559ff85dae2aba622b0bc66f18db88c66ffeb693a2')

package() {
  install -D -m755 ucm "$pkgdir/usr/bin/ucm"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
