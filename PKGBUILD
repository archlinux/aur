pkgname=ttf-segoe-ui-variable
pkgver=1.0
pkgrel=1
pkgdesc='Segoe UI Variable is the new system font for Windows. It is a refreshed take on the classic Segoe and uses variable font technology to dynamically provide great legibility at very small sizes, and improved outlines at display sizes.'
arch=('any')
license=('custom')
url="https://docs.microsoft.com/windows/apps/design/downloads/#fonts"
source=("https://aka.ms/SegoeUIVariable")
sha256sums=('5087e1932abdbd67730aac465fcf2b9ebdbfd89102942e476197ffc74a14ed57')

package() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" "$srcdir"/Segoe-*.ttf
    install -Dm644 "$srcdir/EULA.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
