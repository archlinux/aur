# Maintainer: Manuel Domínguez López <mdomlop at gmail dot com>

_pkgver_year=2017
_pkgver_month=09
_pkgver_day=05

pkgname=pbscrap
pkgver=1.0b
pkgrel=1
pkgdesc="A simple pastebin.com scraper."
arch=('any')

url="https://github.com/mdomlop/$pkgname"
source=("$pkgname-$pkgver.tar.gz::https://github.com/mdomlop/$pkgname/archive/$pkgver.tar.gz")
md5sums=('abfa14099d06214cc6456a2c0eaf3779')

license=('GPL3')

depends=('python>=3' 'python-urllib3')
changelog=ChangeLog


build() {
    cd $srcdir/$pkgname-$pkgver
    make
    }

package() {
    cd $srcdir/$pkgname-$pkgver
    make install DESTDIR=$pkgdir
}
