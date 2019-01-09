# Maintainer:
# Contributor: Michael Straube <michael.straube@posteo.de>

pkgname=pogo
pkgver=1.0
pkgrel=1
pkgdesc='A fast and minimalist audio player'
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
sha256sums=('0582d72885350f56ce9803cbec25bf91aba0d905245cd1cbe76aa661ebf7c316')

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
