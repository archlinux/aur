# Maintainer: Randall Winkhart <idgr at tutanota dot com>
pkgname=sshyp
pkgver=1.4.1
pkgrel=1
pkgdesc='A light-weight, self-hosted, synchronized password manager'
url='https://github.com/rwinkhart/sshyp'
arch=('any')
license=('GPL-3.0-only')
depends=(python gnupg openssh xclip wl-clipboard)
optdepends=('bash-completion: bash completion support')
source=("https://github.com/rwinkhart/sshyp/releases/download/v$pkgver/GENERIC-sshyp-$pkgver.tar.xz")
sha512sums=('8f71b83d26529f59e3ee60af65621cf7096d1668f41d83376a829d85100aede14ae03ff726106c1f94a5aeec4932babd3e392e8c54dddff234e72cac7eba2687')

package() {
    tar xf GENERIC-sshyp-"$pkgver".tar.xz -C "${pkgdir}"
}
