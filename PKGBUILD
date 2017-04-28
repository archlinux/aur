# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=python-tkcolorpicker
pkgver=1.0.0
pkgrel=1
pkgdesc="Color picker dialog for Tkinter, alternative to tkinter.colorchooser."
url="https://github.com/j4321/tkColorPicker"
arch=('any')
license=('GPL3')
makedepends=('python-setuptools')
depends=('python' 'tk')
source=("tkColorPicker-$pkgver.tar.gz::https://github.com/j4321/tkColorPicker/archive/v$pkgver.tar.gz")
sha512sums=('743f14f84eb20c30742341c10ba4073709b456fd321aedcf4e1072b376aebf9eec8d85adc5d3f468f1e451bef3f58b2419a68e041404a838220de160455976e7')
package() {
 cd "$srcdir/tkColorPicker-$pkgver"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
}
