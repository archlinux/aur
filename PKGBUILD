# Maintainer: Randall Winkhart <idgr at tutanota dot com>
pkgname=sshyp
pkgver=1.5.3
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
sha512sums=('3104f38c3659ec60439ff03e4c8497bd7672c3231a66e367e4fe0eaa96f68a3046da9e69101e418c46c8170228f1e27da883f4855bbef421d8714b89ccf10456')

package() {
    tar -xf data.tar.xz -C "${pkgdir}"
}
