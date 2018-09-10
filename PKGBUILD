# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Co-Maintainer: Corax
pkgname=python2-mediainfodll
_pkgname=MediaInfoLib
pkgver=18.08.1
pkgrel=1
pkgdesc="Python 2 library for reading metadata from media files -- shared library"
arch=('any')
url="https://github.com/MediaArea/MediaInfoLib"
license=('BSD 2-Clause')
depends=('libmediainfo' 'python2')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('2eab71d063d20569f47584bb08588212')

package() {
    install -Dm644 ${_pkgname}-${pkgver}/Source/MediaInfoDLL/MediaInfoDLL.py ${pkgdir}/usr/lib/python2.7/site-packages/MediaInfoDLL.py
    install -Dm644 ${_pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}
