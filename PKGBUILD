# $Id: PKGBUILD 222148 2014-09-20 07:31:15Z andyrtr $
# Maintainer: AndyRTR <andyrtr@archlinux.org>

pkgname='hyphen-en-us'
pkgver=2.8.8
pkgrel=1
arch=('any')
url="http://hunspell.sf.net"
license=('GPL2' 'LGPL2.1' 'MPL')
pkgdesc="English hyphenation rules (en_US only)"
source=(http://downloads.sourceforge.net/hunspell/hyphen-${pkgver}.tar.gz)
sha1sums=('0556c392beb59433e577e3517575801212201df6')

package() {
  cd hyphen-${pkgver}
  install -Dm755 hyph_en_US.dic ${pkgdir}/usr/share/hyphen/hyph_en_US.dic
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  cd ${pkgdir}/usr/share/myspell/dicts
  ln -sv /usr/share/hyphen/hyph_en_US.dic .
}
