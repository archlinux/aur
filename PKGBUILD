# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_pkgname=daty
pkgname=$_pkgname-git
pkgver=0.1
pkgrel=1
pkgdesc='Daty Wikidata Editor'
url='https://gitlab.gnome.org/World/daty'
license=('AGPLv3')
arch=('any')
depends=('libhandy' 'python-appdirs' 'python-bleach' 'python-beautifulsoup4' 'python-gobject' 'python-requests' 'python-setproctitle' 'python-pywikibot')
makedepends=('python-setuptools')
provides=($_pkgname)
conflicts=($_pkgname)
source=('daty::git+https://gitlab.gnome.org/World/Daty.git')
sha256sums=('SKIP')

package() {
    cd "${_pkgname}"
    python3 setup.py install --root="${pkgdir}" --optimize=1
}
