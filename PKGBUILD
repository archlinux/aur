# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>
pkgname=youtube-music-uploader
pkgver=1.2.0
pkgrel=1
pkgdesc="YouTube music uploader."
arch=('any')
url="https://github.com/jaymoulin/youtube-music-uploader"
license=('MIT')
depends=('python-requests' 'python-watchdog' 'python-ytmusicapi')
makedepends=('python-setuptools')
source=("https://github.com/jaymoulin/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ee94897c61443a9d6b1297ee5b60a9666d756c5c34d0ca2bc56525b606a503f8')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
