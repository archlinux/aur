author=drawsta
pkgname=hello_archlinux
pkgver=20210211
pkgrel=1
pkgdesc="My first package, which will be deleted later."
arch=('any')
license=('custom')

package() {
  echo -e "#\!/bin/sh\necho -e 'hello archlinux'" > hello_archlinux
  cd "$srcdir"
  install -Dm755 * -t "$pkgdir"/usr/bin/
}
