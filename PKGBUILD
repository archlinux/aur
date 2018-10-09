# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=python-fusepyng
_pkgname=fusepyng
pkgver=1.0.5
pkgrel=1
pkgdesc="Simple ctypes bindings for FUSE"
arch=('i686' 'x86_64')
url="https://github.com/rianhunter/fusepyng"
license=('ISC')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rianhunter/fusepyng/archive/v$pkgver.tar.gz"
        "LICENSE")
md5sums=('35c87380550d42e8448ea66b44b73e6b'
         '62985e35bb52b272658f467939306759')

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
