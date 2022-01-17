# Maintainer: Randall Winkhart <idgr at tutanota dot com>

pkgname=sshyp
pkgver=2022.01.17.fr3.3
pkgrel=1
pkgdesc='A light-weight, self-hosted, synchronized password manager'
url='https://github.com/rwinkhart/sshyp'
arch=('any')
license=('GPL3')
depends=(python gnupg openssh nano xclip wl-clipboard)

source=("https://github.com/rwinkhart/sshyp/releases/download/v$pkgver/sshyp-$pkgver.tar.xz")
sha512sums=('7a8231830b56aaa2850458a91435b0cfebfb02e9b41e279f7a5c96d336cf3dacecf25956f23cee00c00d306e54602448be58679fbc830475caf62d007952613f')

package() {

    tar xf sshyp-"$pkgver".tar.xz -C "${pkgdir}"

}

