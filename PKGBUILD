# Maintainer: Randall Winkhart <idgr at tutanota dot com>
pkgname=sshyp
pkgver=1.2.0
pkgrel=1
pkgdesc='A light-weight, self-hosted, synchronized password manager'
url='https://github.com/rwinkhart/sshyp'
arch=('any')
license=('GPL-3.0-only')
depends=(python gnupg openssh xclip wl-clipboard)
optdepends=('bash-completion: bash completion support')
source=("https://github.com/rwinkhart/sshyp/releases/download/v$pkgver/sshyp-$pkgver.tar.xz")
sha512sums=('e171ebe8d31bba25ffefe6fc9cebf34d1121a765fff7d3a039cff25185d783a451924bf6b19142656077cb35ff08ec93d9bd24bd6fa75df4ab009b1362a12daf')

package() {
    tar xf sshyp-"$pkgver".tar.xz -C "${pkgdir}"
}

