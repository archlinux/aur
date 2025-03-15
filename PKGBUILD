# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="audiosource"
pkgver=1.2
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
b2sums=('8be2f55d4111709c3abc07fae85d07cad7d8d58b750ad085183d8965bd0926591088a48d31670a94adc5953b67bd8a5914a60257e13d9efeabe6a8b121801de6')
options=("!strip")

package(){
 install -D -m 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/audiosource"
}

