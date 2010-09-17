# Maintainer Mateusz Herych <heniekk@gmail.com>
# Contributor sysrq

pkgname=picard
pkgver=0.12.1
pkgrel=3
pkgdesc="Next generation MusicBrainz tagging application (QT4 interface)"
arch=('i686' 'x86_64')
url="http://musicbrainz.org/doc/PicardQt"
license=('GPL')
depends=('python2' 'pyqt' 'qt' 'mutagen' 'libofa' 'ffmpeg')
install=picard.install
source=(http://ftp.musicbrainz.org/pub/musicbrainz/$pkgname/picard-$pkgver.tar.gz)
md5sums=('cfe594d68924afbc0704888130295c85')

build() {
  cd $srcdir/picard-$pkgver
  python2 setup.py config
  python2 setup.py install --root=$pkgdir
}
