# Maintainer: tjbp (archlinux@tjbp.net)

pkgname='shashlik'
pkgver='0.9.2'
pkgrel='1'
pkgdesc='Android Applications on Real Linux'
arch=('x86_64')
url='http://www.shashlik.io/'
license=('unknown')
depends=('lib32-glibc' 'lib32-gcc-libs' 'lib32-zlib' 'python-xdg' 'kdebase-kdialog')
source=("http://static.davidedmundson.co.uk/shashlik/shashlik_$pkgver.deb")
sha256sums=('9f5392c1687f532369f1df98fe89588c8c1d8217e23e497af329ba8d25e74641')

package() {
    tar xvf "$srcdir/data.tar.xz" -C "$pkgdir/"
}
