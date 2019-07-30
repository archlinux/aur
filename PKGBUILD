# Maintainer: Dave Simons <pkgs@simonsd.org> 

pkgname=mutt-ics
pkgver='0.9.2'
pkgrel=1
pkgdesc="Show calendar event details in mutt"
arch=('i686' 'x86_64')
url="https://github.com/dmedvinsky/mutt-ics"
depends=('python' 'python-icalendar')
provides=('mutt-ics')
source=('https://files.pythonhosted.org/packages/5e/a9/18ad85a45640e245bdc37d8ae97fcdef5fea7b7d9eeb9ff9984625a31607/mutt_ics-0.9.2.tar.gz')
md5sums=('190e77a5d324d51a7683d1e55e872eee')

package() {
  cd "$srcdir/mutt_ics-$pkgver"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"

  install -m755 "mutt_ics/mutt_ics.py" "$pkgdir/usr/bin/mutt-ics"
  install -m755 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
