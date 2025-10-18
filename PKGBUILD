# Maintainer: martibarimaff <martino.barisellimaffignoli@gmail.com>

pkgname=otf-mbm-ow-font
pkgver=1.0.0
pkgrel=1
pkgdesc="An Outer Wilds inspired font"
arch=('any')
url="https://github.com/martibarimaff/mbm-OW-Font"
license=('OFL')
source=("https://github.com/martibarimaff/mbm-OW-Font/releases/download/v1.000/$pkgname.tar.gz")
sha256sums=('1bfa55740b750d93570d2e5fa226f5d7ff595654fe7c793e414239e9ce6d4650')


package() {
	cd "$pkgname"
	install -Dm644 *.otf -t "$pkgdir/usr/share/fonts/OTF"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
