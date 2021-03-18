# Maintainer: Jonathon Fernyhough <jonathon+at m2x.dev>
# Contributor: Yarema aka Knedlyk <yupadmin@gmail.com>
# Contributor: zoe <chp321 [at] gmail [dot] com>

pkgname=radiotray
pkgver=0.7.3
pkgrel=15
pkgdesc="An online radio streaming player that runs on a Linux system tray."
arch=(any)
url="https://radiotray.wordpress.com/"
license=(GPL)
depends=('dbus-python' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good'
         'python-gobject' 'python-lxml' 'python-notify2' 'python-pyxdg')
makedepends=('git')
optdepends=('gst-plugins-bad: extra codec support'
            'gst-plugins-ugly: extra codec support'
            'gst-libav: nonfree media decoding'
            'libappindicator-gtk3: indicator applet support')
source=(git+https://github.com/lubosz/radiotray.git#commit=0303ad6017a9a81caa71d046ef270ba6ebefed39)

b2sums=('SKIP')

package() {
    cd $pkgname
    python setup.py install --root="$pkgdir" --optimize=1
}
