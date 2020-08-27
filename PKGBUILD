# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Contributor: samæ <samæ at marvid dot fr>

_name=raleway
_fname=Raleway
pkgbase=$_name-font
pkgname=(otf-$_name ttf-$_name ttf-$_name-variable)
pkgver=4.100
pkgrel=1
pkgdesc='An elegant sans-serif font family, originally designed in a single thin weight'
arch=('any')
url="https://www.theleagueofmoveabletype.com/$_name"
license=('OFL')
groups=('lmt-fonts')
source=("https://github.com/theleagueof/$_name/releases/download/$pkgver/$_fname-$pkgver.tar.xz")
sha256sums=('c233fbe5d9577b449ff745b8baa95b006ea1fdada1280d5aa6ba08aa2c13f37a')

package_otf-raleway() {
    provides=("$pkgbase")
    cd "$_fname-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" static/OTF/*.otf
    # install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" ofl{,-faq}.markdown
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

package_ttf-raleway() {
    provides=("$pkgbase")
    cd "$_fname-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" static/TTF/*.ttf
    # install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" ofl{,-faq}.markdown
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

package_ttf-raleway-variable() {
    provides=("$pkgbase-variable")
    cd "$_fname-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" variable/TTF/*.ttf
    # install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" ofl{,-faq}.markdown
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}
