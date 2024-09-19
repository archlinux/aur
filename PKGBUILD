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
sha256sums_x86_64=('509b895b165af1c5e3eac83d8ffeeb8d0b58938d516472edccd81381513dd858')
sha256sums_aarch64=('0f27c9a8fc2d9b445f2ef10a465abcbc1315d42ec411641ea9695b27679ee24e')

package() {
    cd "$srcdir"

    install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"
}
