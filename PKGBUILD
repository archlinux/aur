# Maintainer: Adam Perkowski <adas1per@protonmail.com>
pkgname=linutil-bin
_pkgname=linutil
pkgver=2024.09.22
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
sha256sums_x86_64=('f80476656fe2e7e1707200d03840d9ce2431ba6e2be678c8fd0ad950ec6b2517')
sha256sums_aarch64=('d00993ba88712cfed0ebadb27141cdf96c58c91b5066fd6667776db2de1b0258')

package() {
    cd "$srcdir"

    install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"
}
