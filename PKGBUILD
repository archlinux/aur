# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=pogo
pkgver=0.9
pkgrel=1
pkgdesc='Plays your music. Nothing else.'
arch=('any')
url='https://github.com/jendrikseipp/pogo'
license=('GPL')
depends=('pygtk' 'gst-python' 'python-mutagen' 'python-dbus' 'python-pillow' 'gtk3')
optdepends=('libnotify: desktop notifications'
            'gnome-settings-daemon: GNOME media keys'
            'pulseaudio: PulseAudio support'
            'gst-plugins-good: PulseAudio support and good codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs'
            'gst-libav: libav codec')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jendrikseipp/pogo/archive/v$pkgver.tar.gz")
sha256sums=('1a0ea47d4bd6ee674dee7825d7adbe91c4d62c0c260c49ba33fd10c12b9c3fb4')

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
