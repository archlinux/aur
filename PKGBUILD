# Maintainer: Dave Simons <pkgs@simonsd.org> 

pkgname=mutt-ics
pkgver='0.7'
pkgrel=1
pkgdesc="Show calendar event details in mutt"
arch=('i686' 'x86_64')
url="https://github.com/dmedvinsky/mutt-ics"
depends=('python' 'python-icalendar')
provides=('mutt-ics')
source=('https://pypi.python.org/packages/1c/89/b2fc49069348fa862f2e3f9d7e8cb4e393506434895fd964915311239767/mutt_ics-0.7.tar.gz#md5=fd46afd391f2e53437f91971ebc64d3a')
md5sums=('fd46afd391f2e53437f91971ebc64d3a')

package() {
  cd "$srcdir/mutt_ics-$pkgver"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"

  install -m755 "mutt_ics/mutt_ics.py" "$pkgdir/usr/bin/mutt-ics"
  install -m755 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
