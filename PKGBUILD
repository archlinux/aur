pkgname=pactest-git
pkgver=0.1
pkgdesc="Test AUR software in a chroot"
pkgrel="1"
arch=("any")
url="https://github.com/mcotocel/pactest"
license=('MIT')
depends=('arch-install-scripts')
source=("git://github.com/mcotocel/pactest")
sha1sums=('SKIP')

package() {
    install -D -t "${pkgdir}/usr/bin" "${srcdir}/pactest/pactest"
}
