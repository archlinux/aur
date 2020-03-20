# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Contributor: samæ <samæ at marvid dot fr>

_fnt_name=league-gothic
pkgbase=$_fnt_name-font
pkgname=(otf-$_fnt_name ttf-$_fnt_name)
pkgver=20160215
# 20140319
_sha=e6dce2137410648b2229d5d4717de8c1cd5f9b97
pkgrel=6
pkgdesc='A revival of an old classic, Alternate Gothic #1'
arch=('any')
url="https://theleagueofmoveabletype.com/$_fnt_name"
license=('OFL')
groups=('lmt-fonts')
provides=("$pkgbase")
source=("$pkgname-$pkgver.zip::https://github.com/theleagueof/$_fnt_name/archive/$_sha.zip")
sha256sums=('f4cc4f754568c4d2b70c3b52a6663677656ee88277901efcdf079b40e8158ab1')

package_otf-league-gothic() {
    cd "$_fnt_name-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" *.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" Open\ Font\ License*.markdown
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" readme.markdown
}

package_ttf-league-gothic() {
    cd "$_fnt_name-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" webfonts/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" Open\ Font\ License*.markdown
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" readme.markdown
}
