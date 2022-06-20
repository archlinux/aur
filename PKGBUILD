# Maintainer: Randall Winkhart <idgr at tutanota dot com>

pkgname=sshyp
pkgver=1.0.0
pkgrel=1
pkgdesc='A light-weight, self-hosted, synchronized password manager'
url='https://github.com/rwinkhart/sshyp'
arch=('any')
license=('GPL3')
depends=(python gnupg openssh nano xclip wl-clipboard)

source=("https://github.com/rwinkhart/sshyp/releases/download/v$pkgver/sshyp-$pkgver.tar.xz")
sha512sums=('1611d330558f1262e8156c448ef6fb4169da94e990c55497bf2ab1fc2d8897db71753b62d76cf3ae53149f0cbc865b6db3fb18629e40acc0147bbc83c45f6c62')

package() {

    tar xf sshyp-"$pkgver".tar.xz -C "${pkgdir}"

}

