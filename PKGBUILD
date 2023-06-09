# Maintainer: Randall Winkhart <idgr at tutanota dot com>
pkgname=sshyp
pkgver=1.4.3
pkgrel=1
pkgdesc='A light-weight, self-hosted, synchronized password manager'
url='https://github.com/rwinkhart/sshyp'
arch=('any')
license=('GPL-3.0-only')
depends=(python gnupg openssh xclip wl-clipboard)
optdepends=('bash-completion: bash completion support')
source=("https://github.com/rwinkhart/sshyp/releases/download/v"$pkgver"/UBUNTU-sshyp_"$pkgver"-"$pkgrel"_all.deb")
sha512sums=('b8e0dbb900fe3f401b92ffc30e23c83b4f4745756cd9c88953f51b3e709064da764ac5238ca7eb025adb004bfd242fca0f6fa3ca7f47a2bb7bc247ee0e06635a')

package() {
    tar -xf data.tar.xz -C "${pkgdir}"
}
