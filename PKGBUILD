pkgname=ttf-neodgm-pro
pkgver=1.010
pkgrel=2
pkgdesc='Proportional Korean TrueType font based on NeoDunggeunmo.'
arch=('any')
url='https://neodgm.dalgona.dev/neodgm_pro.html'
license=('OFL')
install=ttf-neodgm-pro.install
source=("https://github.com/Dalgona/neodgm-pro/releases/download/v${pkgver}/neodgm_pro.ttf")
sha256sums=('7a7822b29a2b9490883d4e4a51232f117ba37eeb87bc92f3ed730608ff48790b')

package()
{
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 $srcdir/neodgm_pro.ttf $pkgdir/usr/share/fonts/TTF/
}
