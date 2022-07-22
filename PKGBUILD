# Maintainer: Randall Winkhart <idgr at tutanota dot com>

pkgname=sshyp
pkgver=1.1.1
pkgrel=1
pkgdesc='A light-weight, self-hosted, synchronized password manager'
url='https://github.com/rwinkhart/sshyp'
arch=('any')
license=('GPL3')
depends=(python gnupg openssh xclip wl-clipboard)

source=("https://github.com/rwinkhart/sshyp/releases/download/v$pkgver/sshyp-$pkgver.tar.xz")
sha512sums=('a9ce372d8cb2a733a048b6dab88030de97eaf94daf4eb2e7e3c4f7b3331188a9115a8975f823883edea289e12dc7ab43c47086e702fbb5c43cc8effc7578186d')

package() {

    tar xf sshyp-"$pkgver".tar.xz -C "${pkgdir}"

}

