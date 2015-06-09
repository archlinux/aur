# Maintainer: murchik <mixturchik@gmail.com>
pkgname=zhudi
pkgver=1.6
pkgrel=1
pkgdesc="Python/GTK3+ GUI to Chinese -English-French-German dictionnaries (CEDICT, CFDICT, HanDeDict, ChE-Dicc…). It also provides pinyin and zhuyin pronunciaton as well as a sentence segmentation utility."
arch=('any')
url="https://github.com/Jiehong/Zhudi"
license=('GPL3')
depends=('python' 'python-gobject' 'pygobject-devel' 'gobject-introspection' 'pango')
conflicts=('zhudi')
install=zhudi.install
changelog=
source=(zhudi::git://github.com/Jiehong/Zhudi)
md5sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    git checkout $pkgver
    msg "Installation in progress…"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}
