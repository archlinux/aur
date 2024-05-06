# Maintainer: Rocket Aaron <i at rocka dot me>

pkgname=ttf-roboto-variable
pkgver=3.009
pkgrel=1
pkgdesc='Variable version of Roboto'
provides=(ttf-roboto)
arch=(any)
url='https://github.com/googlefonts/roboto-classic'
license=(OFL-1.1)
source=("$url/releases/download/v$pkgver/Roboto_v$pkgver.zip")
sha256sums=('e33ed54b1f9e23df82b780c6c17043a49cab46fa9c661dc48c56671ac6868864')

package() {
    install -Dm644 "$srcdir/hinted/Roboto[ital,wdth,wght].ttf" "$pkgdir/usr/share/fonts/TTF/Roboto-VF.ttf"
}
