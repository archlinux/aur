# Maintainer: Pablo Caro <me AT pcaro DOT es>
# Thanks to Fabien Dovero

pkgname=otf-hermit
pkgver=2.0
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="A monospace font designed to be clear, pragmatic and very readable."
arch=('any')
url="https://pcaro.es/p/hermit/"
source=("https://pcaro.es/d/otf-hermit-$pkgver.tar.gz")
license=('custom:OFL')
install=$pkgname.install
sha256sums=('c04b432b088edabc8ff025049535077722869f842fb6f851864106b7f4f03527')
package() {
    install -d "$pkgdir/usr/share/fonts/OTF"
    cp -dpr --no-preserve=ownership "$srcdir/"*.otf "$pkgdir/usr/share/fonts/OTF/"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
