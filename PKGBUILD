# Maintainer: Adam Perkowski <adas1per@protonmail.com>
pkgname=linutil-bin
_pkgname=linutil
pkgver=2024.09.19
pkgrel=2
pkgdesc="Chris Titus Tech's Linutil is a distro-agnostic toolbox designed to simplify everyday Linux tasks."
arch=('x86_64' 'aarch64')
url="https://github.com/ChrisTitusTech/$_pkgname"
license=('MIT')
source_x86_64=("https://github.com/ChrisTitusTech/$_pkgname/releases/download/$pkgver/$_pkgname")
source_aarch64=("https://github.com/ChrisTitusTech/$_pkgname/releases/download/$pkgver/$_pkgname-aarch64")
depends=('git' 'pacman')
optdepends=('ttf-nerd-fonts-symbols: symbols and icons')
conflicts=($_pkgname)
provides=($_pkgname)
sha256sums_x86_64=('4931a0f8dc5956219583eec22a0c9a1d83111cdddeb8a48fc7805d3598fccb23')
sha256sums_aarch64=('93033e65657dc383d4666acc4ef87b82e8e1b4d220528dbc9d4f740d83528acb')

package() {
    cd "$srcdir"

    install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"
}
