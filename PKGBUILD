# Maintainer: Randall Winkhart <idgr at tutanota dot com>

pkgname=sshyp
pkgver=1.1.0
pkgrel=1
pkgdesc='A light-weight, self-hosted, synchronized password manager'
url='https://github.com/rwinkhart/sshyp'
arch=('any')
license=('GPL3')
depends=(python gnupg openssh xclip wl-clipboard)

source=("https://github.com/rwinkhart/sshyp/releases/download/v$pkgver/sshyp-$pkgver.tar.xz")
sha512sums=('b77c0c140d19a489cc9a25f601efb4368edb258a3824bd6e50d15ab0a219eb8fc7703d9ae6d506c5ce9e5c11130c19b162f39bac6c17137d0f346a9e78e3e29c')

package() {

    tar xf sshyp-"$pkgver".tar.xz -C "${pkgdir}"

}

