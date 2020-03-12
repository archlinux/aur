# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: samæ <samæ at marvid dot fr>

_fnt_name=chunk
pkgname=ttf-$_fnt_name
pkgver=20180627
_sha=957d5ddfdaf35368822ec5fcb07e0a118fa63391
pkgrel=3
pkgdesc='An ultra-bold, ultra-awesome slab serif typeface'
arch=('any')
url="http://theleagueofmoveabletype.com/$_fnt_name"
license=('OFL')
groups=('lmt-fonts')
source=("$pkgname-$pkgver.zip::https://github.com/theleagueof/$_fnt_name/archive/$_sha.zip")
sha256sums=('b68946c684bb2b1224a3d0adee105a85ff5194c088bb4f95677a47549ccfe979')

package() {
  cd "$_fnt_name-$_sha"
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" Open\ Font\ License.markdown
}
