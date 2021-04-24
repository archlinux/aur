pkgname=ttf-neodgm-pro
pkgver=1.010
pkgrel=1
pkgdesc='Proportional Korean TrueType font based on NeoDunggeunmo.'
arch=('any')
url='https://neodgm.dalgona.dev/neodgm_pro.html'
license=('OFL')
install=ttf-neodgm-pro.install
source=("https://github.com/Dalgona/neodgm-pro/releases/download/v${pkgver}/neodgm_pro.ttf")
sha256sums=('54a3923f20e5f9546d886d05b301003c2bb0eee9bad5c567d9860b7983d265de')

package()
{
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 $srcdir/neodgm_pro.ttf $pkgdir/usr/share/fonts/TTF/
}
