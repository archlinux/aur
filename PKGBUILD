# Maintainer: Randall Winkhart <idgr at tutanota dot com>

pkgname=sshyp
pkgver=1.0.1
pkgrel=1
pkgdesc='A light-weight, self-hosted, synchronized password manager'
url='https://github.com/rwinkhart/sshyp'
arch=('any')
license=('GPL3')
depends=(python gnupg openssh nano xclip wl-clipboard)

source=("https://github.com/rwinkhart/sshyp/releases/download/v$pkgver/sshyp-$pkgver.tar.xz")
sha512sums=('fde4bce3c7c632e4ba1d98ff2c07975a1d87c6eeb03b2f946eaf942db6b08d77f1c09e1a30dc1c62c0390de2ce90b5d9ee9f3c05f93743bab1c6389e7ea871e2')

package() {

    tar xf sshyp-"$pkgver".tar.xz -C "${pkgdir}"

}

