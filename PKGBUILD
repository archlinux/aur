# Maintainer: Alad Wenter <alad@archlinux.org>
pkgname=youtube-10hourify
pkgver=1.0
pkgrel=1
pkgdesc='loop youtube-videos to 10-hour length'
url='https://github.com/AladW/youtube-10hourify'
arch=('any')
license=('custom:WTFPL')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::$url/releases/download/$pkgver/$pkgver.tar.gz.asc")
depends=('perl')
sha256sums=('64702e84318a404754b897e89218ea73a65c6f4195bfb246b8c915d87e129ce6'
            'SKIP')
validpgpkeys=('DBE7D3DD8C81D58D0A13D0E76BC26A17B9B7018A') # Alad Wenter <alad@archlinux.org>

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 youtube-10hourify "$pkgdir"/usr/bin/youtube-10hourify
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/youtube-10hourify/LICENSE
}
