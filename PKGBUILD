# Maintainer: tjbp (archlinux@tjbp.net)

pkgname='otf-openbaskerville'
pkgver='0.1.0'
pkgrel='1'
pkgdesc="An open source implementation of Fry's Baskerville, a Baskerville derivative by Isaac Moore"
arch=('any')
url="http://klepas.org/openbaskerville/"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
install='otf.install'
source=("https://github.com/klepas/open-baskerville/archive/v0.0.0.zip")
sha256sums=('557dced5e5e0e263d4d9fa311619d86a19bad6275c685053dbf8192e8e90f6ef')

package() {
    # Font installation
    install -d "$pkgdir/usr/share/fonts/OTF"
    install -m644 "$srcdir/OpenBaskerville-$pkgver/OpenBaskerville-$pkgver.otf" "$pkgdir/usr/share/fonts/OTF"

    # Licence installation
    install -d "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -m644 "$srcdir/OpenBaskerville-$pkgver/COPYING-OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
