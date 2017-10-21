# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=python-vulkan
pkgver=1.0.61
pkgrel=1
pkgdesc="The ultimate Python binding for Vulkan API"
arch=('any')
url="https://github.com/realitix/vulkan"
license=('MIT')
depends=('python' 'python-cffi' 'vulkan-icd-loader')
makedepends=('python-pycparser')
options=(!emptydirs)
source=("https://github.com/realitix/vulkan/archive/${pkgver}.tar.gz")
sha384sums=('eb8f663b40123c6de076d80b1e016ed885fddd18b09f08482667d832a7dbc49a8430761fc02905c286bb0b5147c5f107')

package() {
    cd "$srcdir/vulkan-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
