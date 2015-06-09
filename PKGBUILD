# Maintainer: Allen Li <darkfeline@abagofapples.com>

pkgname=torrent-preview
pkgver=1.0
pkgrel=1
pkgdesc="Python script for viewing torrent metadata"
arch=('any')
license=('MIT')
url=("https://github.com/darkfeline/torrent-preview")
depends=('python2' 'python2-bencode')
source=("https://github.com/darkfeline/torrent-preview/archive/${pkgver}.tar.gz")
md5sums=('579246dad04d5c865a9820764848960c')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir"
}
