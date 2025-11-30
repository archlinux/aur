# Maintainer: Stanisław Jasiewicz <stjasiewicz@protonmail.com>
pkgname=netparty-git
pkgver=1.1
pkgrel=1
pkgdesc="A tool for hassle-free LAN parties over the Internet"
arch=('any')
url="https://gitlab.com/Taro94/netparty"
license=('GPL')
depends=('wireguard-tools' 'iproute2')
optdepends=('firejail: recommended for run-game mode')
makedepends=('git')
source=("git+https://gitlab.com/Taro94/netparty.git")
md5sums=('SKIP')
options=(!strip)

package() {
    cd "$srcdir"
    install -Dm 755 "netparty/netparty.sh" "$pkgdir/usr/bin/netparty"
}
