# Maintainer: Yamada Hayao <hayao at fascode.net>

pkgname="rofi-themes-collection-git"
_pkgname=${pkgname%-git}
pkgver=0.0.1
pkgrel=1
pkgdesc="Themes Collection for Rofi Launcher"
arch=('any')
url="https://github.com/newmanls/rofi-themes-collection"
license=('GPL3')
depends=('rofi')
makedepends=('git')
source=("git+$url")
sha256sums=('SKIP')

package(){
    cd "$srcdir/${_pkgname}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 -t "$pkgdir/usr/share/rofi/themes/" themes/*
}

