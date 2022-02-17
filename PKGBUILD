# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: LightDot <lightdot -a-t- g m a i l>

_name=league-mono
_fname=LeagueMono
pkgbase=$_name-font
pkgname=(otf-$_name ttf-$_name ttf-$_name-variable)
pkgver=2.300
pkgrel=1
epoch=1
pkgdesc='A monospace typeface inspired by Fira Mono, Libertinus Mono, and Courier'
arch=('any')
url="https://www.theleagueofmoveabletype.com/$_name"
license=('OFL')
groups=('lmt-fonts')
source=("https://github.com/theleagueof/$_name/releases/download/$pkgver/$_fname-$pkgver.tar.xz")
sha256sums=('16bdc983aa5eb1803a3c2fbb11d15a8cfa1ce317334a61b01f0f3ab302fdcf0d')

package_otf-league-mono() {
    provides=("$pkgbase")
    cd "$_fname-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" static/OTF/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.md
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

package_ttf-league-mono() {
    provides=("$pkgbase")
    cd "$_fname-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" static/TTF/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.md
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

package_ttf-league-mono-variable() {
    provides=("$pkgbase-variable")
    cd "$_fname-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" variable/TTF/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.md
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}
