# Maintainer: Martynas Mickevičius <self at 2m dot lt>
pkgname=ucm-bin
pkgver=M1h
pkgrel=1
pkgdesc='Unison language code manager'
arch=('x86_64')
url='https://www.unisonweb.org'
license=('custom')

source=("ucm::https://github.com/unisonweb/unison/releases/download/release/$pkgver/unison-linux64.tar.gz"
        "https://raw.githubusercontent.com/unisonweb/unison/release/$pkgver/LICENSE")
sha256sums=('917973ccdee78201cdb858bb30d79e74913da44906cf03a96bf122eb03236839'
            '6dd1702f5e06317fef9577559ff85dae2aba622b0bc66f18db88c66ffeb693a2')

package() {
  install -D -m755 ucm "$pkgdir/usr/bin/ucm"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
