pkgname=ttf-neodgm-pro
pkgver=1.011
pkgrel=1
pkgdesc='Proportional Korean TrueType font based on NeoDunggeunmo.'
arch=('any')
url='https://neodgm.dalgona.dev/neodgm_pro.html'
license=('OFL')
install=ttf-neodgm-pro.install
source=("https://github.com/Dalgona/neodgm-pro/releases/download/v${pkgver}/neodgm_pro.ttf")
sha256sums=('290d9ac6288c729fac80d9af00837eeeaa51f9516610e737980e8711096a0446')

package()
{
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 $srcdir/neodgm_pro.ttf $pkgdir/usr/share/fonts/TTF/
}
