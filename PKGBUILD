# Maintainer: Adam Perkowski <adas1per@protonmail.com>
_pkgname='hyprlauncher'
pkgname='hyprlauncher-bin'
pkgver=0.2.1
pkgrel=1
pkgdesc='GUI for launching applications, written in blazingly fast Rust!'
arch=('x86_64')
url="https://github.com/hyprutils/$_pkgname"
license=('GPL-2.0')
source=("$_pkgname-$pkgver::https://github.com/hyprutils/$_pkgname/releases/download/v$pkgver/$_pkgname")
sha256sums=('5af626abef73e70028905fb9235419e557aa9529f6b4425f37dc47a3d479d15e')
depends=('gtk4' 'gtk4-layer-shell')
conflicts=($_pkgname)
provides=($_pkgname)

package() {
    cd "$srcdir"

    install -Dm0755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
