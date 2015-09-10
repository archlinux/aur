# Maintainer: Dave Simons <pkgs@simonsd.org> 

pkgname=mutt-ics
pkgver='0.5'
pkgrel=1
pkgdesc="A tool to show calendar event details in mutt"
arch=('i686' 'x86_64')
url="https://github.com/dmedvinsky/mutt-ics"
depends=('python' 'python-icalendar')
makedepends=('git')
provides=('mutt-ics')
source=('git://github.com/dmedvinsky/mutt-ics#commit=401e6d6')
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"

  install -m755 "bin/mutt-ics" "$pkgdir/usr/bin/mutt-ics"
  install -m755 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
