# Maintainer: Alad Wenter <alad@archlinux.org>
pkgname=youtube-10hourify
pkgver=1.3
pkgrel=1
pkgdesc='loop youtube-videos to 10-hour length'
url='https://github.com/AladW/youtube-10hourify'
arch=('any')
license=('custom:WTFPL')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::$url/releases/download/$pkgver/$pkgver.tar.gz.asc")
depends=('perl' 'youtube-dl' 'ffmpeg')
sha256sums=('a8546b2e924e7ed0b1b52297eeeee83fba904c87015bd0c52eab2b3da9a868d4'
            'SKIP')
validpgpkeys=('DBE7D3DD8C81D58D0A13D0E76BC26A17B9B7018A') # Alad Wenter <alad@archlinux.org>

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 youtube-10hourify "$pkgdir"/usr/bin/youtube-10hourify
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/youtube-10hourify/LICENSE
}
