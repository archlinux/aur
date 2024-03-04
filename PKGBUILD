pkgname=python-compact-json-git
pkgver=0.0.1
pkgrel=2
pkgdesc="A JSON formatter that produces compact but human-readable"
arch=("any")
url="https://github.com/masaccio/compact-json"
license=('MIT')
makedepends=('python-setuptools')
source=("git+https://github.com/masaccio/compact-json.git")
provides=('python-compact-json')

sha256sums=('SKIP')

package() {
    cd "${srcdir}/compact-json"
    python -m pip install --root="$pkgdir" --ignore-installed .
    install -Dm644 LICENSE.rst "${pkgdir}"/usr/share/licenses/python-compact-json/LICENSE
}
