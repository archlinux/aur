# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=python-pyspotify
pkgver=2.1.3
_pkgname=pyspotify
pkgrel=1
pkgdesc="A Python Spotify library"
arch=('any')
url="http://pyspotify.mopidy.com/"
license=('APACHE')
depends=('python' 'libspotify' 'python-cffi' 'python-setuptools')
conflicts=('pyspotify-git' 'pyspotify')
source=("https://github.com/mopidy/$_pkgname/archive/v${pkgver}.tar.gz")
md5sums=('2594290cd6d0ec0f7d76ddf94bef32ac')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
