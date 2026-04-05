# This is an AUR PKGBUILD for spxc
pkgname=spxc
pkgver=0.3
pkgrel=1
pkgdesc="A simple CLI tool that shows version and help"
arch=('any')
url="https://aur.archlinux.org/packages/spxc"
license=('MIT')
depends=('bash')
source=("spxc")
sha256sums=('5a6c63da028c34baf500d1f16106101209095f2fa0fed4d34b34767d9977c754')

package() {
    install -Dm755 "${srcdir}/spxc" "${pkgdir}/usr/bin/spxc"
}
