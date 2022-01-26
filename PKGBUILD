# Maintainer: Randall Winkhart <idgr at tutanota dot com>

pkgname=sshyp
pkgver=2022.01.26.fr3.4
pkgrel=1
pkgdesc='A light-weight, self-hosted, synchronized password manager'
url='https://github.com/rwinkhart/sshyp'
arch=('any')
license=('GPL3')
depends=(python gnupg openssh nano xclip wl-clipboard)

source=("https://github.com/rwinkhart/sshyp/releases/download/v$pkgver/sshyp-$pkgver.tar.xz")
sha512sums=('53c6a21c1887f54c8a41e31d3302356091dfab9497bc6fdb8b27d24dccc05802bdaf6c0fc75f9248c39ddb8251358d867b2de1fb51d697eaa0bc507bbe2a0c2d')

package() {

    tar xf sshyp-"$pkgver".tar.xz -C "${pkgdir}"

}

