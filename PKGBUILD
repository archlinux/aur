# Maintainer: boenki <boenki at gmx dot de>
# Contributor: Max Roder <maxroder@web.de>
# Contributor: soeren <nonick@posteo.de>
# Contributor: orgel <orgel0@freenet.de>

pkgname='otr-verwaltung++'
pkgver='0.9.6'
pkgrel='1'
pkgdesc='Manage your onlinetvrecorder.com files: cut, preview cuts, rate cutlists etc.'
arch=('any')
url='http://elbersb.de/otrverwaltung'
license=('GPL3')
depends=('pygtk' 'libtorrent-rasterbar' 'avidemux-cli' 'avidemux-gtk' 'wine' 'mediainfo-gui' 'gstreamer0.10-gnonlin' 'gst-plugins-ugly' 'python2-xdg' 'python2-simplejson' 'gstreamer0.10-python' 'gstreamer0.10-ffmpeg' 'mplayer')
optdepends=('avidemux-qt' 'otrdecoder')
makedepends=('python2-distutils-extra')
source=("git://github.com/monarc99/otr-verwaltung.git")
md5sums=('SKIP')

package() {
   cd "$srcdir/otr-verwaltung"
  python2 setup.py install --root=${pkgdir} --optimize=1
}
