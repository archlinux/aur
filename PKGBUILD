# Maintainer: Randall Winkhart <idgr at tutanota dot com>
pkgname=sshyp
pkgver=1.5.1
pkgrel=1
pkgdesc='A light-weight, self-hosted, synchronized password manager'
url='https://github.com/rwinkhart/sshyp'
arch=('any')
license=('GPL-3.0-only')
depends=(python gnupg openssh)
optdepends=(
    'wl-clipboard: wayland clipboard support'
    'xclip: x11 clipboard support'
    'bash-completion: bash completion support'
)
source=("https://github.com/rwinkhart/sshyp/releases/download/v"$pkgver"/DEBIAN-sshyp_"$pkgver"-"$pkgrel"_all.deb")
sha512sums=('e043a3973e8151278bb33b104522450c5f210ed7d2863d2bfb5012699132064f2fca490cb285e0cf67194ecbc62326b64e37e42f9dc980e1dad4c7f1503ea28e')

package() {
    tar -xf data.tar.xz -C "${pkgdir}"
}
