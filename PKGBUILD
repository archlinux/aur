# Maintainer: Randall Winkhart <idgr at tutanota dot com>
pkgname=sshyp
pkgver=1.4.2
pkgrel=1
pkgdesc='A light-weight, self-hosted, synchronized password manager'
url='https://github.com/rwinkhart/sshyp'
arch=('any')
license=('GPL-3.0-only')
depends=(python gnupg openssh xclip wl-clipboard)
optdepends=('bash-completion: bash completion support')
source=("https://github.com/rwinkhart/sshyp/releases/download/v"$pkgver"/UBUNTU-sshyp_"$pkgver"-"$pkgrel"_all.deb")
sha512sums=('65f1fd2324d4d229221f2f978d890d1eb36d7f2223b2af57fa4f80eee298de16c9b3a10439c42bc26d12b92c96501227d38b88ff972ca6bee248853d7f895b4a')

package() {
    tar -xf data.tar.xz -C "${pkgdir}"
}
