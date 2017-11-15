# Maintainer: Det <nimetonmaili g-mail>
# Contributor: Otto Allmendinger <otto.allmendinger@gmail.com>

pkgname=ld-lsb
pkgver=3
pkgrel=7
pkgdesc='Faking a Linux Standard Base runtime'
arch=('x86_64')
license=('GPL')
url="http://www.linuxfoundation.org/"
depends=('lib32-glibc')

package() {
  # Create the directory
  install -d "$pkgdir"/usr/lib/

  # Links
  ln -s ld-linux-x86-64.so.2 "$pkgdir"/usr/lib/ld-lsb-x86-64.so.2
  ln -s ld-linux-x86-64.so.2 "$pkgdir"/usr/lib/ld-lsb-x86-64.so.3
  ln -s ld-linux.so.2 "$pkgdir"/usr/lib/ld-lsb.so.2
  ln -s ld-linux.so.2 "$pkgdir"/usr/lib/ld-lsb.so.3
}

# vim:set ts=2 sw=2 et: