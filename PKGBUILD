# Maintainer: Randall Winkhart <idgr at tutanota dot com>
pkgname=sshyp
pkgver=1.4.0
pkgrel=1
pkgdesc='A light-weight, self-hosted, synchronized password manager'
url='https://github.com/rwinkhart/sshyp'
arch=('any')
license=('GPL-3.0-only')
depends=(python gnupg openssh xclip wl-clipboard)
optdepends=('bash-completion: bash completion support')
source=("https://github.com/rwinkhart/sshyp/releases/download/v$pkgver/sshyp-$pkgver.tar.xz")
sha512sums=('14d16a9e2153dafeab2294d63927984c71b69375c6a174bc8a684575969d6ab7e6685a0ebe9d93ff5ab3ed953b6772afbbfedc1c81ea4b45ba03a23da38776c4')

package() {
    tar xf sshyp-"$pkgver".tar.xz -C "${pkgdir}"
}

