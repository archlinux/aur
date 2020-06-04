# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=flake8-fixme
pkgname=python-$_pkgname

pkgver=1.1.1
pkgrel=1
pkgdesc="Check for FIXME, TODO and other temporary developer notes."

url='https://github.com/tommilligan/flake8-fixme'
arch=('any')
license=('Apache-2.0')

depends=('python')

source=("https://github.com/tommilligan/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('99a5c97a57029630ac83e33892eac79f378fb33b1ca291f63ae91e8507c3ccc8a63e0a958ab3e325e1e8c3ea3eb3de1cb6b57dcb0ef47c0ea6a67de057271a30')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

