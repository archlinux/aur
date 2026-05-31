# Maintainer: Periodicbrake <periodicbrake63@gmail.com>
pkgname=chplymouth-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple interactive CLI script to change and apply Plymouth themes across all kernels"
arch=('any')
url="https://github.com/periodicbrake63/chplymouth"
license=('MIT')
depends=('bash' 'plymouth')
source=("chplymouth::git+https://github.com/periodicbrake63/chplymouth.git")
md5sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/chplymouth/chplymouth" "${pkgdir}/usr/bin/chplymouth"
}
