# Maintainer:
# Contributor: Michael Straube <michael.straube@posteo.de>

pkgname=pogo
pkgver=1.0.1
pkgrel=1
pkgdesc='A fast and minimalist audio player'
arch=('any')
url='https://github.com/jendrikseipp/pogo'
license=('GPL')
depends=('gst-python' 'python-mutagen' 'python-dbus' 'python-pillow' 'gtk3')
optdepends=('libnotify: desktop notifications'
            'gnome-settings-daemon: GNOME media keys'
            'pulseaudio: PulseAudio support'
            'gst-plugins-good: PulseAudio support and good codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs'
            'gst-libav: libav codec')
source=("https://github.com/jendrikseipp/pogo/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('24e7e6244f59c30350c392c622d7250097c04a5f3033f7bc276a5aa4e5704355cfdac08180bd18788c50937be43efe4fe434c616c0256573b2779f8f8697ee3a')

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
