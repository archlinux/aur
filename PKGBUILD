# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Contributor: samæ <samæ at marvid dot fr>

_name=league-gothic
_fname=LeagueGothic
pkgbase=$_name-font
pkgname=(otf-$_name ttf-$_name)
pkgver=1.600
pkgrel=1
epoch=1
pkgdesc='A revival of an old classic, Alternate Gothic #1'
arch=('any')
url="https://www.theleagueofmoveabletype.com/$_name"
license=('OFL')
groups=('lmt-fonts')
source=("https://github.com/theleagueof/$_name/releases/download/$pkgver/$_fname-$pkgver.tar.xz")
sha256sums=('d332ece52571ebdea768c57aa6adfd8b5e87cb84ee07b925ba3f93aef4949de5')

package_otf-league-gothic() {
    provides=("$pkgbase")
    cd "$_fname-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" static/OTF/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.md
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

package_ttf-league-gothic() {
    provides=("$pkgbase")
    cd "$_fname-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" static/TTF/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.md
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}
