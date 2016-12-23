# Maintainer: Patrick Griffis <tingpign@tingpng.se

_modname='gbulb'
pkgname='python-gbulb'
pkgver=0.4
pkgrel=1
pkgdesc='Implmementation of asyncio using GLib'
arch=('any')
url='https://github.com/nathan-hoad/gbulb'
license=('Apache')
makedepends=('python-setuptools')
depends=('python-gobject')
optdepends=('gtk3: Gtk application integration')
source=("https://github.com/nathan-hoad/gbulb/archive/$pkgver.tar.gz")
sha256sums=('91b60a05da3197e537525224f88ba23d951b9175a6a33d6d4565e492ab591c35')

package() {
    cd "$_modname-$pkgver"

    python ./setup.py install --prefix=/usr --root="$pkgdir" --optimize=2
}
