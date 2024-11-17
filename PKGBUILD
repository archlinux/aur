# Maintainer: Adam Perkowski <adas1per@protonmail.com>
_pkgname='hyprlauncher'
pkgname='hyprlauncher-bin'
pkgver=0.1.9
pkgrel=1
pkgdesc='GUI for launching applications, written in blazingly fast Rust!'
arch=('x86_64')
url="https://github.com/hyprutils/$_pkgname"
license=('GPL-2.0')
source=("$_pkgname-$pkgver::https://github.com/hyprutils/$_pkgname/releases/download/v$pkgver/$_pkgname")
sha256sums=('44b609d424788bb2f587735971f267e8ca148c81649fca2166a895b534a25f37')
depends=('gtk4' 'gtk4-layer-shell')
conflicts=($_pkgname)
provides=($_pkgname)

package() {
    cd "$srcdir"

    install -Dm0755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
