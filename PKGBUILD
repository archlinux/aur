# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Contributor: samæ <samæ at marvid dot fr>

_name=league-spartan
_fname=LeagueSpartan
pkgbase=$_name-font
pkgname=(otf-$_name ttf-$_name ttf-$_name-variable)
pkgver=2.210
pkgrel=1
epoch=1
pkgdesc='A geometric sans-serif revival of ATF’s classic Spartan'
arch=('any')
url="https://www.theleagueofmoveabletype.com/$_name"
license=('OFL')
groups=('lmt-fonts')
source=("https://github.com/theleagueof/$_name/releases/download/$pkgver/$_fname-$pkgver.tar.xz")
sha256sums=('d67faf9ceba579c41624078e4628e0ce644b3cfb0f2c2e2ea20dbe3517ceabaa')

package_otf-league-spartan() {
    provides=("$pkgbase")
    cd "$_fname-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" static/OTF/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" ofl{,-faq}.markdown
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" readme.markdown
}

package_ttf-league-spartan() {
    provides=("$pkgbase")
    cd "$_fname-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" static/TTF/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" ofl{,-faq}.markdown
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" readme.markdown
}

package_ttf-league-spartan-variable() {
    provides=("$pkgbase-variable")
    cd "$_fname-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" variable/TTF/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" ofl{,-faq}.markdown
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" readme.markdown
}
