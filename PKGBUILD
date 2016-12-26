# Maintainer: Dave Simons <pkgs@simonsd.org> 

pkgname=mutt-ics
pkgver='0.8'
pkgrel=1
pkgdesc="Show calendar event details in mutt"
arch=('i686' 'x86_64')
url="https://github.com/dmedvinsky/mutt-ics"
depends=('python' 'python-icalendar')
provides=('mutt-ics')
source=('https://pypi.python.org/packages/32/fe/b385ac8b55e8e2de11cd73cd14cd1697a228d707f5fae0b3fbcabd2f68d2/mutt_ics-0.8.tar.gz')
md5sums=('f9c1570b8e6cc493e828f0db786f9ef3')

package() {
  cd "$srcdir/mutt_ics-$pkgver"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"

  install -m755 "mutt_ics/mutt_ics.py" "$pkgdir/usr/bin/mutt-ics"
  install -m755 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
