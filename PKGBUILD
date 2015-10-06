# Maintainer: Benoit Favre <benoit.favre@lif.univ-mrs.fr>
pkgname=ttf-computer-modern-fonts
pkgver=1
pkgrel=3
pkgdesc="Computer Modern in TTF (deprecated)"
url="http://www.mozilla.org/projects/mathml/fonts/"
arch=('any')
license=('custom:BakoMa')
source=(http://distfiles.gentoo.org/distfiles/texcm-ttf.zip
        license.txt)
        
md5sums=('7bd39b8860b09c8d5e507dae70484b80'
         '5f5d31d821e847fbeb2f32ea39186d10')

package() {
  cd "$srcdir"/texcm-ttf

  install --directory "$pkgdir"/usr/share/fonts/TTF/
  cp *.ttf "$pkgdir"/usr/share/fonts/TTF/

  install --directory "$pkgdir"/usr/share/licenses/$pkgname
  cp "$srcdir"/license.txt "$pkgdir"/usr/share/licenses/$pkgname  
}
