# Maintainer: Colin Woodbury <colin@fosskers.ca>
pkgname=setwall-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Set your wallpaper on Wayland or X11."
url="https://github.com/fosskers/rs-setwall"
license=("MIT")
arch=("x86_64")
provides=("setwall")
options=("strip")
source=("https://github.com/fosskers/rs-setwall/releases/download/v$pkgver/setwall-$pkgver-x86_64.tar.gz")
sha256sums=("39ebe34c1969e4b60f3f12bafcafb8d476b520404007d8481f34841e8a2fb15e")

package() {
    install -Dm755 setwall -t "$pkgdir/usr/bin/"
}
