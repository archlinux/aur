# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: samæ <samæ at marvid dot fr>

_fnt_name=sniglet
pkgname=ttf-$_fnt_name
pkgver=20160215
# 20010526
_sha=5c6b0860bdd0d8c4f16222e4de3918c384db17c4
pkgrel=3
pkgdesc='A fun rounded display face that’s great for headlines'
arch=('any')
url="http://theleagueofmoveabletype.com/$_fnt_name"
license=('OFL')
groups=('lmt-fonts')
conflicts=('ttf-impallari-sniglet')
source=("$pkgname-$pkgver.zip::https://github.com/theleagueof/$_fnt_name/archive/$_sha.zip")
sha256sums=('706c2aecf861f101e01dcadb2dc0b2e6da573d949f77bfcec639ef2cbbc11948')

package() {
    cd "$_fnt_name-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" Open\ Font\ License*.markdown
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" readme.markdown
}
