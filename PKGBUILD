# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: samæ <samæ at marvid dot fr>

_fnt_name=linden-hill
pkgname=ttf-$_fnt_name
pkgver=20160215
# 20110526
_sha=a3f7ae6c4cac1b7e5ce5269e1fcc6a2fbb9e31ee
pkgrel=3
pkgdesc="A digital version of Frederic Goudy’s font Deepdene"
arch=('any')
url="http://theleagueofmoveabletype.com/$_fnt_name"
license=('OFL')
groups=('lmt-fonts')
source=("$pkgname-$pkgver.zip::https://github.com/theleagueof/$_fnt_name/archive/$_sha.zip")
sha256sums=('b683e6e25d16d321f6a91c00fb4fd3d62136c4e503a49a8107f5d8ad68ed6ef9')

package() {
    cd "$_fnt_name-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" webfonts/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" Open\ Font\ License*.markdown
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" readme.markdown
}
