# Maintainer: Benoit Favre <benoit.favre@lif.univ-mrs.fr>
pkgname=ttf-computer-modern-fonts
pkgver=1
pkgrel=2
pkgdesc="Computer Modern in TTF"
url="http://www.mozilla.org/projects/mathml/fonts/"
arch=('any')
license=('custom:BakoMa')
source=(http://www.mozilla.org/projects/mathml/fonts/bakoma/texcm-ttf.zip
        http://www.mozilla.org/projects/mathml/fonts/bakoma/license.txt)
md5sums=('7bd39b8860b09c8d5e507dae70484b80'
         '3ae8d75400a0078db5d7276366c776b0')

package() {
  cd "$srcdir"/texcm-ttf

  install --directory "$pkgdir"/usr/share/fonts/TTF/
  cp *.ttf "$pkgdir"/usr/share/fonts/TTF/

  install --directory "$pkgdir"/usr/share/licenses/$pkgname
  cp "$srcdir"/license.txt "$pkgdir"/usr/share/licenses/$pkgname  
}
