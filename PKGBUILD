# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>
pkgname=youtube-music-uploader
pkgver=1.3.0
pkgrel=1
pkgdesc="YouTube music uploader."
arch=('any')
url="https://github.com/jaymoulin/youtube-music-uploader"
license=('MIT')
depends=('python-requests' 'python-watchdog' 'python-ytmusicapi')
makedepends=('python-setuptools')
source=("https://github.com/jaymoulin/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9e5ba43888a7d560c44759c22609120befe25436c381b5b6658dcc62265a961a')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
