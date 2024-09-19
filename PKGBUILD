# Maintainer: Adam Perkowski <adas1per@protonmail.com>
pkgname=linutil-bin
_pkgname=linutil
pkgver=2024.09.19
pkgrel=1
pkgdesc="Chris Titus Tech's Linutil is a distro-agnostic toolbox designed to simplify everyday Linux tasks."
arch=('x86_64')
url="https://github.com/ChrisTitusTech/$_pkgname"
license=('MIT')
source=("https://github.com/ChrisTitusTech/$_pkgname/releases/download/$pkgver/$_pkgname")
depends=('git' 'pacman')
optdepends=('ttf-nerd-fonts-symbols: symbols and icons')
conflicts=($_pkgname)
provides=($_pkgname)
sha256sums=('4b4b2f07664c1817accfcc1fe52ee4fe437f8dedbb76c2c3d15badbf6412421d')

package() {
    cd "$srcdir"

    install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"
}
