# $Id$
# Maintainer : Nicolas Perrin <booloki@lokizone.net>


pkgname=wazzuf-ripper
pkgver=5.7
pkgrel=1
pkgdesc="Wazzuf Ripper is a software to rip various media as DVD and Blu-ray to .mkv file(s)."
arch=(any)
license=('GPL3')
url="http://wazzuf-ripper.lokizone.net/"
depends=('mplayer' 'mencoder' 'zenity' 'gksu' 'imdb-cli' 'bdchapters' 'mkvtoolnix-cli' 'tsmuxer'
	 'mediainfo' 'lame' 'vorbis-tools' 'ogmtools' 'p7zip' 'imagemagick' 'libdvdcss' 'lsdvd')
optdepends=('vlc: video dumping support'
            'cdrkit: genisoimage - DVD to iso file suppport'
            'opus-tools: Opus audio support')
source=("https://github.com/Booloki/$pkgname/archive/$pkgver.tar.gz")
md5sums=('39d64199157243b982118d3116d22a48')

package() {
    cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
