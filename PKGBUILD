# Maintainer: Alex Tharp <toastercup at gmail dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Brenton Horne <brentonhorne77 at gmail dot com>
pkgname=foobnix
pkgver=3.2.1
pkgrel=1
pkgdesc="GTK+ music player"
arch=('i686' 'x86_64')
url="http://www.foobnix.com"
license=('GPL3')
depends=('python-chardet' 'python-simplejson' 'python-mutagen'
         'gst-plugins-good' 'gst-plugins-base' 'gst-plugins-ugly'
         'gst-plugins-bad' 'gst-libav' 'gst-python' 'webkit2gtk'
         'libkeybinder3' 'fuseiso' 'python-notify2' 'python3-keybinder'
         'lame' 'faac' 'ffmpeg' 'python-dbus' 'python-pylast')
makedepends=('python-setuptools')
provides=('foobnix')
conflicts=('foobnix')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('072a28a5b26b3977a607957187d2cf7b2368c6a5ad4dd8db78712d19f607f85185e97c198425f3084e52c348ac7f566cb150f6e6a6b59188068855d0ef4feca6')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
