# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>
pkgname=youtube-music-uploader
pkgver=1.1.0
pkgrel=1
pkgdesc="YouTube music uploader."
arch=('any')
url="https://github.com/jaymoulin/youtube-music-uploader"
license=('MIT')
depends=('python-requests' 'python-watchdog' 'python-ytmusicapi')
makedepends=('python-setuptools')
source=("https://github.com/jaymoulin/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0836a945a1eaf558c01b57efbdb5b2a1afefef746e00832bddb0819eae622dbe')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
