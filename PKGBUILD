# Maintainer: tjbp (archlinux@tjbp.net)

pkgname='shashlik'
pkgver='0.9.1'
pkgrel='2'
pkgdesc='Android Applications on Real Linux'
arch=('x86_64')
url='http://www.shashlik.io/'
license=('unknown')
depends=('lib32-glibc' 'lib32-gcc-libs' 'lib32-zlib' 'python-xdg' 'kdebase-kdialog')
source=("http://static.davidedmundson.co.uk/shashlik/shashlik_$pkgver.deb")
sha256sums=('888c535a9ff2e8563712cbe0fa3a208ccb21f9f90d66a434fb4c40fce6404520')

package() {
    tar xvf "$srcdir/data.tar.xz" -C "$pkgdir/"
}
