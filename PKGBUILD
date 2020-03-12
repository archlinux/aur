# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: samæ <samæ at marvid dot fr>

_fnt_name=blackout
pkgname=ttf-$_fnt_name
pkgver=20160215
pkgrel=5
pkgdesc="A bad-ass, unholy-mother-shut-your-mouth stencil sans-serif"
arch=('any')
url="http://theleagueofmoveabletype.com/$_fnt_name"
license=('OFL')
groups=('lmt-fonts')
source=("$pkgname-$pkgver.zip::https://github.com/theleagueof/$_fnt_name/archive/master.zip")
sha256sums=('cfc75d15b72e558a3e87bf2cb9f69f09756b5179254e8131ac3d59437f41143b')

package() {
  cd "$_fnt_name-master"
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" Open*.markdown
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" readme.markdown
}
