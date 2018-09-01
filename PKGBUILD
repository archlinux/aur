# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gnumicr
pkgver=0.30
pkgrel=1
pkgdesc='An open-source licensed Type 1 MICR E13-B font'
arch=('any')
url='https://github.com/alerque/gnumicr'
license=('GPL')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/alerque/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e087b0a85d1e5aa1ed4b11ae8f5716ec74e48ab4ca1b10b7fbba0dff6784b39b')

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 GnuMICR.ttf -t "$pkgdir/usr/share/fonts/TTF/"
    install -Dm644 GnuMICR.pfb -t "$pkgdir/usr/share/fonts/Type1/"
    install -Dm644 GnuMICR.pfm -t "$pkgdir/usr/share/fonts/Type1/"
    install -Dm644 GnuMICR.afm -t "$pkgdir/usr/share/fonts/Type1/"
    install -Dm644 GnuMICR.otf -t "$pkgdir/usr/share/fonts/OTF/"
}
