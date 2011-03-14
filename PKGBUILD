# Maintainer Mateusz Herych <heniekk@gmail.com>
# Contributor sysrq

pkgname=picard
pkgver=0.13
pkgrel=1
pkgdesc="Next generation MusicBrainz tagging application (QT4 interface)"
arch=('i686' 'x86_64')
url="http://musicbrainz.org/doc/PicardQt"
license=('GPL')
depends=('python2-qt' 'mutagen' 'libofa' 'ffmpeg')
optdepends=('libdiscid: CD-Lookup feature')
install=picard.install
source=(http://ftp.musicbrainz.org/pub/musicbrainz/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('bc8dc9109de218b544204669119d10c5')

build() {
  cd $srcdir/picard-$pkgver
  python2 setup.py config
  python2 setup.py install --root=$pkgdir
}
