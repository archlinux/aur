# Maintainer: Jonathan Sanfilippo <jonalinux dot uk at gmail dot com>
pkgname=clean
pkgver=1.0
pkgrel=1
pkgdesc="System cleaner"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/architalia/clean"
license=('GPL3')
groups=()
depends=('bash' 'bc')
makedepends=()
checkdepends=()
optdepends=()
source=("git+https://github.com/architalia/$pkgname.git#branch=main")
sha256sums=('SKIP' 
            'a5sHRKz81dn+zDqCwkUpOb2aJSteps37+6ZhrvNf5HE')

package() {
	install -Dm755 clean "$pkgdir/usr/bin/"
}
