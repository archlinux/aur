# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Contributor: samæ <samæ at marvid dot fr>

_name=league-spartan
pkgbase=$_name-font
pkgname=(otf-$_name ttf-$_name-variable) # ttf-$_name
pkgver=2.201
pkgrel=1
pkgdesc='A geometric sans-serif revival of ATF’s classic Spartan'
arch=('any')
url="https://www.theleagueofmoveabletype.com/$_name"
license=('OFL')
groups=('lmt-fonts')
source=("$_name-$pkgver.tar.gz::https://github.com/theleagueof/$_name/archive/$pkgver.tar.gz")
sha256sums=('7550066a20c19767e5084085d525efba71b7d73fbba2fce4a8eda98464c491b2')

package_otf-league-spartan() {
    provides=("$pkgbase")
    cd "$_name-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" fonts/static/otf/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" ofl{,-faq}.markdown
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" readme.markdown
}

package_ttf-league-spartan() {
    provides=("$pkgbase")
    cd "$_name-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" fonts/static/ttf/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" ofl{,-faq}.markdown
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" readme.markdown
}

package_ttf-league-spartan-variable() {
    provides=("$pkgbase-variable")
    cd "$_name-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" fonts/variable/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" ofl{,-faq}.markdown
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" readme.markdown
}
