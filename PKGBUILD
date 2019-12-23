# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=mopidy-local
pkgver=3.0.0
pkgrel=2
pkgdesc="Mopidy extension for local media playback"
arch=('any')
url="https://github.com/mopidy/mopidy-local"
license=('APACHE')
depends=('mopidy>=3.0'
         'python-setuptools'
         'python-uritools')
conflicts=('mopidy-local-images' 'mopidy-local-sqlite')
replaces=('mopidy-local-images' 'mopidy-local-sqlite')
provides=('mopidy-local-images' 'mopidy-local-sqlite')
makedepends=('python3')
source=("https://github.com/mopidy/mopidy-local/archive/v${pkgver}.tar.gz")
md5sums=('4e2dc0a330fab012b2805677d7234abc')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=4 sw=4 et:
