# Maintainer: Randall Winkhart <idgr at tutanota dot com>

pkgname=sshyp
pkgver=2022.01.13.fr3
pkgrel=1
pkgdesc='A light-weight, self-hosted, synchronized password manager'
url='https://github.com/rwinkhart/sshyp'
arch=('any')
license=('GPL3')
depends=(python gnupg openssh nano xclip wl-clipboard)

source=("https://github.com/rwinkhart/sshyp/releases/download/v$pkgver/sshyp-$pkgver.tar.xz")
sha512sums=('f618c8210750c87834b50ef38e2f03ee19494c4947828008bbd31d23942ef5dc10e367d42637dbbbec9c13a54be74210418270ec3b2a5c8c8183910ec1abc929')

package() {

    tar xf sshyp-"$pkgver".tar.xz -C "${pkgdir}"

}

