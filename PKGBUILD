# Maintainer: Alad Wenter <alad@archlinux.org>
pkgname=youtube-10hourify
pkgver=1.2
pkgrel=1
pkgdesc='loop youtube-videos to 10-hour length'
url='https://github.com/AladW/youtube-10hourify'
arch=('any')
license=('custom:WTFPL')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::$url/releases/download/$pkgver/$pkgver.tar.gz.asc")
depends=('perl' 'youtube-dl' 'ffmpeg')
sha256sums=('0cfc2a249531f25e710cb3349f35ee0c2a1b5f67a47f8ff60f801348e5da38bc'
            'SKIP')
validpgpkeys=('DBE7D3DD8C81D58D0A13D0E76BC26A17B9B7018A') # Alad Wenter <alad@archlinux.org>

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 youtube-10hourify "$pkgdir"/usr/bin/youtube-10hourify
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/youtube-10hourify/LICENSE
}
