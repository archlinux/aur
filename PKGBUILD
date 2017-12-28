# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=python-vulkan
pkgver=1.0.61.3
pkgrel=1
pkgdesc="The ultimate Python binding for Vulkan API"
arch=('any')
url="https://github.com/realitix/vulkan"
license=('MIT')
depends=('python' 'python-cffi' 'vulkan-icd-loader')
makedepends=('python-pycparser')
options=(!emptydirs)
source=("https://github.com/realitix/vulkan/archive/${pkgver}.tar.gz")
sha384sums=('83d7faf8ee4f745006463ff4e0a8ca09d00ba634a6acfed9272d437086686f464315cc26d2504f8ab1a2e7bad11bd86b')

package() {
    cd "$srcdir/vulkan-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
