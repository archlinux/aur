# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: samæ <samæ at marvid dot fr>

_fnt_name=chunk
pkgname=ttf-$_fnt_name
pkgver=20180627
pkgrel=2
pkgdesc="An ultra-bold, ultra-awesome slab serif typeface"
arch=('any')
url="http://theleagueofmoveabletype.com/$_fnt_name"
license=('OFL')
groups=('lmt-fonts')
source=("$pkgname-$pkgver.zip::https://github.com/theleagueof/$_fnt_name/archive/master.zip")
sha256sums=('f38062c4b6ecf42e0cc0b4ec3c8d6976c040ac2e87777f44cec6b1047470d949')

package() {
  cd "$_fnt_name-master"
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" Open\ Font\ License.markdown
}
