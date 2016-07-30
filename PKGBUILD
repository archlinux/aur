# Maintainer: Davide Iosca <dvdios [at] aol [dot] com>

pkgname='torram'
pkgdesc='Recreates a torrent download folder with fully and partially downloaded files'
pkgver=0.9.0
pkgrel=1
url='https://github.com/vbuell/torram'
arch=('any')
license=('GPL')
depends=('python2' 'python2-bencode')
optdepends=('python2-pyqt4: For using qBittorrent output directory autodetection')
source=('git+https://github.com/vbuell/torram.git')
sha1sums=('SKIP')
makedepends=('git')

package() {
  cd ./torram
  python2 setup.py install --prefix=/usr --root="${pkgdir}" || return 1
}

