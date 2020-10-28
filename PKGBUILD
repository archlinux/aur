# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Contributor: samæ <samæ at marvid dot fr>

_name=league-spartan
_fname=LeagueSpartan
pkgbase=$_name-font
pkgname=(otf-$_name ttf-$_name ttf-$_name-variable)
pkgver=2.220
pkgrel=1
epoch=1
pkgdesc='A geometric sans-serif revival of ATF’s classic Spartan'
arch=('any')
url="https://www.theleagueofmoveabletype.com/$_name"
license=('OFL')
groups=('lmt-fonts')
source=("https://github.com/theleagueof/$_name/releases/download/$pkgver/$_fname-$pkgver.tar.xz")
sha256sums=('141a96e215554871504dca16be159901bbb0d56f3a84224f39fe472c7ab4ef47')

package_otf-league-spartan() {
    provides=("$pkgbase")
    cd "$_fname-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" static/OTF/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.md
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

package_ttf-league-spartan() {
    provides=("$pkgbase")
    cd "$_fname-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" static/TTF/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.md
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

package_ttf-league-spartan-variable() {
    provides=("$pkgbase-variable")
    cd "$_fname-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" variable/TTF/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.md
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}
