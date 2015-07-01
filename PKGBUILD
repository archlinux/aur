# Maintainer: petRUShka <petrushkin@yandex.ru >

pkgname=torrent-mount
pkgver=1.0.8
pkgrel=2
pkgdesc="Mount a torrent (or magnet link) as a filesystem in real time using torrent-stream and fuse. AKA MAD SCIENCE!"
arch=('any')
url="https://github.com/mafintosh/torrent-mount"
license=('MIT')
depends=('nodejs' 'fuse' 'python2')
source=("https://github.com/mafintosh/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('8184176bfa6fbf255b52f3f3bba2fd58')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export PYTHON=python2.7 
#  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  npm install --user root -g --prefix "${pkgdir}/usr"
}

# vim:set ts=2 sw=2 et:
