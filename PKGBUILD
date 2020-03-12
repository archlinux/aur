# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: samæ <samæ at marvid dot fr>

_fnt_name=junction
pkgname=ttf-$_fnt_name
pkgver=20160215
# 20140329
_sha=fb73260e86dd301b383cf6cc9ca8e726ef806535
pkgrel=3
pkgdesc='expanding a humanist sans-serif typeface, Junction'
arch=('any')
url="http://theleagueofmoveabletype.com/$_fnt_name"
license=('OFL')
groups=('lmt-fonts')
source=("$pkgname-$pkgver.zip::https://github.com/theleagueof/$_fnt_name/archive/$_sha.zip")
sha256sums=('303e27b8f8f40fb4f7a0b13e1e4fb019f23d49fbe05d9e608f2c9627db43d2f3')

package() {
  cd "$_fnt_name-$_sha"
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" webfonts/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" Open\ Font\ License*.markdown
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" readme.markdown
}
