# Maintainer: Randall Winkhart <idgr at tutanota dot com>

pkgname=sshyp
pkgver=2022.02.16.fr4.7
pkgrel=2
pkgdesc='A light-weight, self-hosted, synchronized password manager'
url='https://github.com/rwinkhart/sshyp'
arch=('any')
license=('GPL3')
depends=(python gnupg openssh nano xclip wl-clipboard)

source=("https://github.com/rwinkhart/sshyp/releases/download/v$pkgver/sshyp-$pkgver.tar.xz")
sha512sums=('2043b3ab3ff43f3da546387ae39c4f78e4468bd63b5fd852526d6dc6d0de2df9c8e8576a14094d76fc060584819fc8280556728af579b49cde8495fd09df6169')

package() {

    tar xf sshyp-"$pkgver".tar.xz -C "${pkgdir}"

}

