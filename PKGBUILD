# Maintainer: battli4k <battli4k@gmail.com>
pkgname=battli4k-ascii
pkgver=1.0.0
pkgrel=1
pkgdesc="Программа для вывода ASCII котика в терминал"
arch=('any')
url="https://archlinux.org"
license=('MIT')
depends=('bash')
source=("battli4k-ascii.sh")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/battli4k-ascii.sh" "${pkgdir}/usr/bin/battli4k-ascii"
}
