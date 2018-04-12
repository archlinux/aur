# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=python-vulkan
pkgver=1.1.71.2
pkgrel=1
pkgdesc="The ultimate Python binding for Vulkan API"
arch=('any')
url="https://github.com/realitix/vulkan"
license=('MIT')
depends=('python' 'python-cffi' 'vulkan-icd-loader')
makedepends=('python-pycparser')
options=(!emptydirs)
source=("https://github.com/realitix/vulkan/archive/${pkgver}.tar.gz")
sha384sums=('25552e72c95f41ce33cb7e3f10ebce2083898b4d17f0853892712ca85671a8bce2c09d1eb171308c1c9308bcf0c4efc0')

package() {
    cd "$srcdir/vulkan-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
