# Maintainer: philanecros <philanecros@gmail.com>

pkgname=autoupdate
pkgver=1
pkgrel=1
pkgdesc="Download packages to update automatically."
arch=('any')
url="https://aur.archlinux.org/packages/autoupdate/"
license=('GPL')
source=(autoupdate.service
        autoupdate.timer)
md5sums=('9c3fbbffa6cf5e589fd255a5ea6ca64c'
         '129db06fab0fd9478ef3a4cf6a5baa96')

package() {
  targetdir="$pkgdir/usr/lib/systemd/system/"
  install -m 755 -d $targetdir

  install -D -m644 autoupdate.{service,timer} $targetdir
}

# vim:set ts=2 sw=2 et:
