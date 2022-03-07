# Maintainer: mutantmonkey <aur@mutantmonkey.mx>
# Contributor: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Dimitrios Vogiatzis <me@dimtree.net>

pkgname=python-plexapi
_name="PlexAPI"
source=("$pkgname-$pkgver.tar.gz::https://github.com/pkkid/python-plexapi/archive/$pkgver.tar.gz")
pkgver=4.10.0
pkgrel=1
pkgdesc="Python bindings for the Plex API."
arch=('any')
url="https://github.com/pkkid/python-plexapi"
license=('BSD')
depends=('python-requests'
         'python-tqdm'
         'python-websocket-client')
makedepends=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7a667ee9c350706bb92b2d48fbfb11723284b9fe1610d00c062af66b5b31f9d6')

package() {
    cd "$_name-$pkgver"
    python ./setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
