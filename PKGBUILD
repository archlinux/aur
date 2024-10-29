# Maintainer: Adam Perkowski <adas1per@protonmail.com>
_pkgname='hyprlauncher'
pkgname='hyprlauncher-bin'
pkgver=0.1.2
pkgrel=1
pkgdesc='GUI for launching applications, written in blazingly fast Rust!'
arch=('x86_64')
url="https://github.com/nnyyxxxx/$_pkgname"
license=('GPL-2.0')
source=("$_pkgname-$pkgver::https://github.com/nnyyxxxx/$_pkgname/releases/download/v$pkgver/$_pkgname")
sha256sums=('81e22972325ff0e0eda9304848bde7e11d18cfa62a7acfa09bbb8522857f058e')
depends=('glibc' 'gcc-libs' 'gtk4')
conflicts=($_pkgname)
provides=($_pkgname)

package() {
    cd "$srcdir"

    install -Dm0755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
