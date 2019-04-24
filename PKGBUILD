# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Co-Maintainer: Corax
pkgname=('python-mediainfodll' 'python2-mediainfodll')
pkgbase=python-mediainfodll
_gitname=MediaInfoLib
pkgver=19.04
pkgrel=1
pkgdesc="Python shared library for reading metadata from media files"
arch=('any')
url="https://github.com/MediaArea/MediaInfoLib"
license=('BSD 2-Clause')
source=("$_gitname-$pkgver.tar.gz::https://github.com/MediaArea/$_gitname/archive/v$pkgver.tar.gz")
sha256sums=('bd992bad71438cb3a353c102fd8c823391eeec406c6a420996fed95bf3d1f685')

package_python-mediainfodll() {
    pkgdesc="Python 3 shared library for reading metadata from media files"
    depends=('libmediainfo' 'python')

    install -Dm644 "$_gitname-$pkgver/Source/MediaInfoDLL/MediaInfoDLL.py" "$pkgdir/usr/lib/python3.7/site-packages/MediaInfoDLL.py"
    install -Dm644 "$_gitname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-mediainfodll() {
    pkgdesc="Python 2 shared library for reading metadata from media files"
    depends=('libmediainfo' 'python2')

    install -Dm644 "$_gitname-$pkgver/Source/MediaInfoDLL/MediaInfoDLL.py" "$pkgdir/usr/lib/python2.7/site-packages/MediaInfoDLL.py"
    install -Dm644 "$_gitname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
