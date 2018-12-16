# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=daty-git
pkgver=0.1
pkgrel=1
pkgdesc='Daty Wikidata Editor'
url='https://gitlab.com/tallero/daty'
license=('AGPLv3')
arch=('any')
depends=('libhandy' 'python-appdirs' 'python-bleach' 'python-beautifulsoup4' 'python-gobject' 'python-requests' 'python-setproctitle' 'python-pywikibot')
makedepends=('python-setuptools')
provides=('daty')
conflicts=('daty')
source=('daty::git+https://gitlab.com/tallero/daty.git')
sha256sums=('SKIP')

package() {
    cd "daty"
    python3 setup.py install --root="${pkgdir}" --optimize=1
}
