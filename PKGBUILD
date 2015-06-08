# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Stepan Usatiuk aka stepus53 <stepus53@gmail.com>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>

pkgname=eclipse-avr
pkgver=2.4.2
pkgrel=1
pkgdesc="AVR Plugin for Eclipse"
arch=('any')
url='http://avr-eclipse.sourceforge.net/wiki/index.php/The_AVR_Eclipse_Plugin'
license=('EPL')
depends=('eclipse' 'eclipse-cdt' 'avr-gcc' 'avr-libc' 'avrdude')
source=("http://downloads.sourceforge.net/project/avr-eclipse/avr-eclipse%20stable%20release/$pkgver/de.innot.avreclipse.p2repository-$pkgver.zip")
sha1sums=('b30145e87629bfbeefd7e47d6ed7397b4204d749')

package() {
  cd "$srcdir"

  install -d "$pkgdir/usr/share/eclipse/dropins/avr/eclipse/"{features,plugins}
  install -m644 features/* "$pkgdir/usr/share/eclipse/dropins/avr/eclipse/features/"
  install -m644 plugins/* "$pkgdir/usr/share/eclipse/dropins/avr/eclipse/plugins/"
}
