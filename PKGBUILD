# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=python-fusepyng
_pkgname=fusepyng
pkgver=1.0.7
pkgrel=1
pkgdesc="Simple ctypes bindings for FUSE"
arch=('i686' 'x86_64')
url="https://github.com/rianhunter/fusepyng"
license=('ISC')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rianhunter/fusepyng/archive/v$pkgver.tar.gz"
#source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/47/29/5bf0957800a01d77b9a343d8982f31aba84799cd800b2af847a9121e9ad0/$_pkgname-$pkgver.tar.gz"
        "LICENSE")
md5sums=('78cb2589907ce07b5ec0246098787f99'
         '62985e35bb52b272658f467939306759')

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
