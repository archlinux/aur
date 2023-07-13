# Maintainer: Randall Winkhart <idgr at tutanota dot com>
pkgname=sshyp
pkgver=1.5.0
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
sha512sums=('1e91fb09685342ab4100228eac802d25d544b0c21d4eb093fb8cf251db54d39282835a6b9a14d430cd77c9fa4e1352d6ee7aee4a4d8b15702987a47c6b3a1d92')

package() {
    tar -xf data.tar.xz -C "${pkgdir}"
}
