# Maintainer: Adam Perkowski <adas1per@protonmail.com>
pkgname=linutil-bin
_pkgname=linutil
pkgver=2024.09.18
pkgrel=1
pkgdesc="Chris Titus Tech's Linutil is a distro-agnostic toolbox designed to simplify everyday Linux tasks."
arch=('x86_64')
url="https://github.com/ChrisTitusTech/$_pkgname"
license=('MIT')
source=("https://github.com/ChrisTitusTech/$_pkgname/releases/download/$pkgver/$_pkgname")
depends=('git' 'pacman' 'glibc' 'gcc-libs' 'libalpm.so')
conflicts=($_pkgname)
provides=($_pkgname)
sha256sums=('572b734ca01f867a775475a833e9dc2a7492d2f8ca855ca38cdbf10bb6f59739')

package() {
    cd "$srcdir"

    install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"
}
