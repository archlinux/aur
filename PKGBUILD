# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=python-pyspotify
pkgver=2.1.3
_pkgname=pyspotify
pkgrel=4
pkgdesc="A Python Spotify library"
arch=('any')
url="http://pyspotify.mopidy.com/"
license=('APACHE')
depends=('python' 'libspotify' 'python-cffi')
makedepends=('python-setuptools')
conflicts=('pyspotify-git' 'pyspotify')
source=("https://github.com/mopidy/$_pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('6765235cc6469c619689cdb051ad0e0c9077baaafc7cb156aae5cb14f1c43ff8')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
