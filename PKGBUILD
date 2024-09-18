# Maintainer: Adam Perkowski <adas1per@protonmail.com>
pkgname=linutil-bin
_pkgname=linutil
pkgver=2024.09.03
pkgrel=1
pkgdesc="Chris Titus Tech's Linux Toolbox - Linutil is a distro-agnostic toolbox designed to simplify everyday Linux tasks."
arch=('x86_64')
url="https://github.com/ChrisTitusTech/$_pkgname"
license=('MIT')
source=("https://github.com/ChrisTitusTech/linutil/releases/download/$pkgver/linutil")
depends=('git' 'pacman' 'glibc' 'gcc-libs' 'libalpm.so')
conflicts=($_pkgname)
provides=($_pkgname)
sha256sums=('5a9d5d6d6e44937b24f8c304829b60fe35276cd63fdf15dd3de412e8ebc99472')

package() {
    cd "$srcdir"

    install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"
}
