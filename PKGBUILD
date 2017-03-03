# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=pogo
pkgver=0.9.2
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
sha256sums=('1a0555be78998c0eae770994d40b684b682b827129f4385a1f6042ba67376049')

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
