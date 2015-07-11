# Maintainer: Pablo Caro <me AT pcaro DOT es>
# Thanks to Fabien Dovero

pkgname=otf-hermit
pkgver=1.21
pkgrel=2
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="A monospace font designed to be clear, pragmatic and very readable."
arch=('any')
url="https://pcaro.es/p/hermit/"
source=("https://pcaro.es/d/otf-hermit-$pkgver.tar.gz")
license=('custom:OFL')
install=$pkgname.install
md5sums=('95e44bd81eb96f04e129ee019726db9a')
package() {
    install -d "$pkgdir/usr/share/fonts/OTF"
    cp -dpr --no-preserve=ownership "$srcdir/"*.otf "$pkgdir/usr/share/fonts/OTF/"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
