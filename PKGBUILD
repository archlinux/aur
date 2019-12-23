# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=python-pyspotify
pkgver=2.1.2
_pkgname=pyspotify
pkgrel=1
pkgdesc="A Python Spotify library"
arch=('any')
url="http://pyspotify.mopidy.com/"
license=('APACHE')
depends=('python' 'libspotify' 'python-cffi' 'python-setuptools')
conflicts=('pyspotify-git' 'pyspotify')
source=("https://github.com/mopidy/$_pkgname/archive/v${pkgver}.tar.gz")
md5sums=('43182d7c38f83df9ad0bf3bf0c88cdb2')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
