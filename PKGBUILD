# Maintainer: Hamza <everyoneexe001 at gmail dot com>
pkgname=python-patchright
pkgver=1.58.2
pkgrel=1
pkgdesc="Patched Playwright for bypassing bot detection"
arch=('x86_64')
url="https://github.com/Kaliiiiiiiiii-Vinyzu/patchright"
license=('Apache')
depends=('python' 'python-playwright')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/py3/p/patchright/patchright-$pkgver-py3-none-manylinux1_x86_64.whl")
noextract=("patchright-$pkgver-py3-none-manylinux1_x86_64.whl")
sha256sums=('13aef416c59f23f0fb552658281890ef349db2bee2e449c159560867c2e6cb61')

package() {
    pip install --isolated --root="$pkgdir" --no-deps \
        "$srcdir/patchright-$pkgver-py3-none-manylinux1_x86_64.whl"
}