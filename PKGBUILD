pkgname=rustmius-bin
_pkgname=rustmius
pkgver=2.0.0
pkgrel=1
pkgdesc="Une alternative locale complète à Termius pour Linux (GTK4)"
arch=('x86_64')
url="https://github.com/Cleboost/Rustmius"
license=('MIT')
depends=('libadwaita' 'gtk4' 'vte4')
provides=("$_pkgname")
conflicts=("$_pkgname")

source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-x86_64")
sha256sums_x86_64=('039e842bf0d81d136aa0fac2fd7e8ad9ce3e61abcc1f0cef96af06082ff561e8')

package() {
    install -Dm755 "$_pkgname-x86_64" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
}
