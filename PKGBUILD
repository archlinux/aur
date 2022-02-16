# Maintainer: Randall Winkhart <idgr at tutanota dot com>

pkgname=sshyp
pkgver=2022.02.16.fr4.3
pkgrel=1
pkgdesc='A light-weight, self-hosted, synchronized password manager'
url='https://github.com/rwinkhart/sshyp'
arch=('any')
license=('GPL3')
depends=(python gnupg openssh nano xclip wl-clipboard)

source=("https://github.com/rwinkhart/sshyp/releases/download/v$pkgver/sshyp-$pkgver.tar.xz")
sha512sums=('76d80e2266bdbbcebda23b5f5fe8f39a88d5f5d0292929e393617880146a6d60e63e3ae46538d293dda9f9e507cc0470de9997e174c3ffea99d833c03b6ef146')

package() {

    tar xf sshyp-"$pkgver".tar.xz -C "${pkgdir}"

}

