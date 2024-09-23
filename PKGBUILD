# Maintainer: Adam Perkowski <adas1per@protonmail.com>
pkgname=linutil-bin
_pkgname=linutil
pkgver=2024.09.23
pkgrel=1
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
sha256sums_x86_64=('58fde2b517768e73d73135a82ea94db01738ab2d56038321404aa7f83e773060')
sha256sums_aarch64=('ae13f1839af195b6bfb501e0b58fb7ba324c3178435df83afe9b311873c9c57b')

package() {
    cd "$srcdir"

    install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"
}
