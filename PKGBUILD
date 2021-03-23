# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=kjv1611
pkgbase=$_name-font
pkgname=(otf-$_name)
pkgver=3.6.1
pkgrel=1
pkgdesc='A complete digital font restoration of the typeface found in the 1611 King James Bible'
arch=('any')
url="https://github.com/ctrlcctrlv/$_name"
license=('OFL')
source=("$_name-$pkgver.otf::$url/releases/download/v$pkgver/${_name^^}.otf"
		"$_name-$pkgver-LICENSE.txt::$url/raw/v$pkgver/LICENSE.txt")
sha256sums=('cff7f1a9c81ec59c09a3b3e3d36a01c8a494e4d7843143e1c0e89ac867ffbf48'
            '0ea667fb557836c9a1f7c802fcced24d781cfcb8696e1a57cab1b0a727957a9c')

package_otf-kjv1611() {
    provides=("$pkgbase")
    install -Dm644 $_name-$pkgver.otf "$pkgdir/usr/share/fonts/OTF/${_name^^}.otf"
    install -Dm644 $_name-$pkgver-LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
