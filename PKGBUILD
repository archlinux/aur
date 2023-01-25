# Maintainer: Pratik Pingale <pratikbpingale9075@gmail.com>
pkgname=boo-grub-git
pkgver=1.0
pkgrel=1
pkgdesc="A dark grub2 bootloader theme theme based on Dracula grub"
arch=('any')
url="https://github.com/PROxZIMA/boo-grub"
license=('MIT')
depends=('grub')
makedepends=()
provides=("${pkgname}")
conflicts=()
source=('git+https://github.com/PROxZIMA/boo-grub.git')
sha256sums=('SKIP')

package() {
    cd "${srcdir}/boo-grub"
    mkdir -p "${pkgdir}/usr/share/grub/themes/"
    cp -r boo "${pkgdir}/usr/share/grub/themes/"
}
