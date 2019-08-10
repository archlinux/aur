# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=python-vulkan
pkgver=1.1.99.1
pkgrel=1
pkgdesc="The ultimate Python binding for Vulkan API"
arch=('any')
url="https://github.com/realitix/vulkan"
license=('MIT')
depends=('python' 'python-cffi' 'vulkan-icd-loader')
makedepends=('python-pycparser')
options=(!emptydirs)
source=("https://github.com/realitix/vulkan/archive/${pkgver}.tar.gz")
sha384sums=('43675c9ae7092a31b02478768da8bb89ec53bca74dafa692f9fac687e096e40dc8cef879f104e84d0b8a1e18b5853ff7')

package() {
    cd "$srcdir/vulkan-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
