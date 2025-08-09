# Maintainer: gonsolo@gmail.com
pkgname=python-volare
pkgver=0.20.6
pkgrel=1
pkgdesc="A version manager for OpenLane and related tools"
arch=('any')
url="https://pypi.org/project/volare/"
license=('Apache')
depends=('python' 'python-click' 'python-gitpython' 'python-requests' 'python-pyyaml')
source=("https://files.pythonhosted.org/packages/py3/v/volare/volare-$pkgver-py3-none-any.whl")
sha256sums=('7ff6ac0a79e59087f2db4255556b3a0fd2d1e3e54afb776c5d73f64242f36b01')

package() {
    python -m installer --destdir="$pkgdir" "$srcdir/volare-$pkgver-py3-none-any.whl"
}
