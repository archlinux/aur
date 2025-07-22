# Maintainer: gonsolo@gmail.com
pkgname=python-volare
pkgver=0.9.0  # Update to latest version
pkgrel=1
pkgdesc="A version manager for OpenLane and related tools"
arch=('any')
url="https://pypi.org/project/volare/"
license=('Apache')
depends=('python' 'python-click' 'python-gitpython' 'python-requests' 'python-pyyaml')
source=("https://files.pythonhosted.org/packages/py3/v/volare/volare-$pkgver-py3-none-any.whl")
sha256sums=('70e40eaafd3f745ea297c92c6aaf390c0fdeeed6e98209d6aa610a67a62209fa')

package() {
    python -m installer --destdir="$pkgdir" "$srcdir/volare-$pkgver-py3-none-any.whl"
}
