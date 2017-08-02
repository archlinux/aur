# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=python-vulkan
pkgver=1.0.49
pkgrel=1
pkgdesc="The ultimate Python binding for Vulkan API"
arch=('any')
url="https://github.com/realitix/vulkan"
license=('MIT')
depends=('python' 'python-cffi')
makedepends=('python-pycparser')
options=(!emptydirs)
source=("https://github.com/realitix/vulkan/archive/${pkgver}.tar.gz")
sha384sums=('4239fbf5e72d901a44093b48bbaa355069db61a585ed71d283c27a017e1c14703954e91cf968987143dd747930d7ade2')

package() {
    cd "$srcdir/vulkan-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
