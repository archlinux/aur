# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: samæ <samæ at marvid dot fr>

_fnt_name=fanwood
pkgname=ttf-$_fnt_name
pkgver=20160215
pkgrel=4
pkgdesc="A serif based on the work of a famous Czech-American type designer of yesteryear"
arch=('any')
url="http://theleagueofmoveabletype.com/$_fnt_name"
license=('OFL')
groups=('lmt-fonts')
source=("$pkgname-$pkgver.zip::https://github.com/theleagueof/$_fnt_name/archive/master.zip")
sha256sums=('343377b57551358d8f9778ff5f3123ed34257334f25522c0f294f8c96812f5a7')

package() {
  cd "$_fnt_name-master"
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" webfonts/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" Open\ Font\ License.markdown
}
