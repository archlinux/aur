# Maintainer: tjbp (archlinux@tjbp.net)

pkgname='otf-openbaskerville'
pkgver='0.0.75'
pkgrel='3'
pkgdesc="An open source implementation of Fry's Baskerville, a Baskerville derivative by Isaac Moore"
arch=('any')
url="http://klepas.org/openbaskerville/"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
install='otf.install'
source=("http://cloud.github.com/downloads/klepas/open-baskerville/OpenBaskerville-$pkgver.zip")
sha256sums=('646e0236ee8fb7b16a12cecfc95767c64f91ea60fd8a6c783c34b4703c2f448a')

package() {
    # Font installation
    install -d "$pkgdir/usr/share/fonts/OTF"
    install -m644 "$srcdir/OpenBaskerville-$pkgver/OpenBaskerville-$pkgver.otf" "$pkgdir/usr/share/fonts/OTF"

    # Licence installation
    install -d "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -m644 "$srcdir/OpenBaskerville-$pkgver/COPYING-OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
