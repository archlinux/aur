# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=kjv1611
pkgbase=$_name-font
pkgname=(otf-$_name)
pkgver=3.6
pkgrel=3
pkgdesc='A complete digital font restoration of the typeface found in the 1611 King James Bible'
arch=('any')
url="https://github.com/ctrlcctrlv/$_name"
license=('OFL')
source=("$_name-$pkgver.otf::$url/releases/download/v$pkgver/${_name^^}.otf"
		"$_name-$pkgver-LICENSE.txt::$url/raw/v$pkgver/LICENSE.txt")
sha256sums=('fc96e79c9d823eada8bb6e6074dec0b2d70280e1dae1dfb0c1afcd5710e441c5'
            '0ea667fb557836c9a1f7c802fcced24d781cfcb8696e1a57cab1b0a727957a9c')

package_otf-kjv1611() {
    provides=("$pkgbase")
    install -Dm644 $_name-$pkgver.otf "$pkgdir/usr/share/fonts/OTF/${_name^^}.otf"
    install -Dm644 $_name-$pkgver-LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
