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
source=("https://github.com/rwinkhart/sshyp/releases/download/v"$pkgver"/GENERIC-LINUX-sshyp-"$pkgver".tar.xz")
sha512sums=('cd7b9f2ec065b694adcb23b0debce2cace2cf2945e211c6ae52c6a8d5f07e5ea08f6d87d2b14c035611976598d47645887d47bbcb2b611090315b8494d91074c')

package() {
    tar -xf GENERIC-LINUX-sshyp-"$pkgver".tar.xz -C "${pkgdir}"
}
