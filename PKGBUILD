# Maintainer Mateusz Herych <heniekk@gmail.com>
# Contributor sysrq

pkgname=picard
pkgver=0.12.1
pkgrel=5
pkgdesc="Next generation MusicBrainz tagging application (QT4 interface)"
arch=('i686' 'x86_64')
url="http://musicbrainz.org/doc/PicardQt"
license=('GPL')
depends=('python2-qt' 'mutagen' 'libofa' 'ffmpeg')
optdepends=('libdiscid: CD-Lookup feature')
install=picard.install
source=(http://ftp.musicbrainz.org/pub/musicbrainz/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('cfe594d68924afbc0704888130295c85')

build() {
  cd $srcdir/picard-$pkgver
  python2 setup.py config
  python2 setup.py install --root=$pkgdir
}
