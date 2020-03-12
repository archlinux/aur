# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: samæ <samæ at marvid dot fr>

_fnt_name=knewave
pkgname=ttf-$_fnt_name
pkgver=20160215
_sha=f335d5ff1f12e4acf97d4208e1c37b4d386e57fb
pkgrel=3
pkgdesc='A bold, painted face font for the rocker within'
arch=('any')
url="http://theleagueofmoveabletype.com/$_fnt_name"
license=('OFL')
groups=('lmt-fonts')
source=("$pkgname-$pkgver.zip::https://github.com/theleagueof/$_fnt_name/archive/$_sha.zip")
sha256sums=('e5fc9f85d929f2ddb678a55786a65cd63435d75e9f146e09aff07ca68eda52d9')

package() {
    cd "$_fnt_name-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" Open\ Font\ License*.markdown
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" readme.markdown
}
