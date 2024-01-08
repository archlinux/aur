# Maintainer: Randall Winkhart <idgr at tutanota dot com>
pkgname=sshyp
pkgver=1.5.2
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
sha512sums=('5a6180ba5e1c0ad52e972e6772126dac0170344f8922b6615fe8221920d6e3ee2b4df8f9dc6ea679c3d776e2c613bd40d0851ec550a8d4c0a61bf27053201465')

package() {
    tar -xf data.tar.xz -C "${pkgdir}"
}
