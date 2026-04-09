# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="audiosource"
pkgver=1.5
pkgrel=1
pkgdesc="Use an Android device as a USB microphone"
url="https://github.com/gdzx/audiosource"
license=("GPL2")
arch=("any")
depends=("android-tools"
         "bash"
         "libpulse"
         "python")
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/audiosource")
b2sums=('b03bb02fed416f268c47c359536f05b9d5764233f1c9818990d17b8c5f52fae8e51e3cc6288101fd4de59a875f9fa1252986107986b7acabaf8906c54d805532')
options=("!strip")

package(){
 install -D -m 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/audiosource"
}

