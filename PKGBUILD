# Maintainer: Dmitriy Q krotesk<at>mail<dot>ru

pkgname=checkio-client
pkgver=0.3.2
pkgrel=1
pkgdesc="Command-line tool for playing CheckiO games."
arch=("any")
url="https://github.com/CheckiO/checkio-client"
license=("GPL2")
depends=("python")
#         "python-daemon"
#         "python-aiohttp"
#         "python-aiohttp-cors"
#         "python-pid")
makedepends=("python-pip")
source=(git+https://github.com/CheckiO/checkio-client.git)
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir/" --optimize=1
}
