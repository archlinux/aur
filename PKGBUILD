# Maintainer: westpain <homicide@disroot.org>
pkgname=ttf-segoe-fluent-icons
pkgver=1.0
pkgrel=3
pkgdesc='Font containing a collection of icons that used in Windows.'
arch=('any')
license=('custom')
url="https://docs.microsoft.com/windows/apps/design/downloads/#fonts"
source=("https://aka.ms/SegoeFluentIcons")
sha256sums=('87208b9543ad17383a1b1b292fe9133c546ba20b2bc824975be372a4851b3e44')

package() {
    mv "$srcdir/Segoe Fluent Icons.ttf" "$srcdir/Segoe-Fluent-Icons.ttf"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "$srcdir/Segoe-Fluent-Icons.ttf"
    install -Dm644 "$srcdir/EULA.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
