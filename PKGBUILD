# Maintainer: Randall Winkhart <idgr at tutanota dot com>
pkgname=sshyp
pkgver=1.3.0
pkgrel=1
pkgdesc='A light-weight, self-hosted, synchronized password manager'
url='https://github.com/rwinkhart/sshyp'
arch=('any')
license=('GPL-3.0-only')
depends=(python gnupg openssh xclip wl-clipboard)
optdepends=('bash-completion: bash completion support')
source=("https://github.com/rwinkhart/sshyp/releases/download/v$pkgver/sshyp-$pkgver.tar.xz")
sha512sums=('e152a735589d3c2c88c40a6aa1bd4483c6fc46905b38131035fe72a91bd440bbe9e13eea0ef727a6ef4c09398937d20d10e704ac16f6d8ca265d347843b1f961')

package() {
    tar xf sshyp-"$pkgver".tar.xz -C "${pkgdir}"
}

