# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: OmeGa <omega [U+0040] mailoo [.] org>

_fnt_name=league-gothic
pkgname=otf-$_fnt_name
pkgver=20140319
_sha=e6dce2137410648b2229d5d4717de8c1cd5f9b97
pkgrel=1
pkgdesc='A revival of an old classic, Alternate Gothic #1'
arch=('any')
url="https://theleagueofmoveabletype.com/$_fnt_name"
license=('OFL')
groups=('lmt-fonts')
provides=('league-gothic-font')
conflicts=("ttf-$_fnt_name")
source=("$pkgname-$pkgver.zip::https://github.com/theleagueof/$_fnt_name/archive/$_sha.zip")
sha256sums=('f4cc4f754568c4d2b70c3b52a6663677656ee88277901efcdf079b40e8158ab1')

package() {
    cd "$_fnt_name-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" *.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" Open\ Font\ License*.markdown
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" readme.markdown
}

# vim:set ts=2 sw=2 et:
