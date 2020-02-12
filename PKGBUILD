# Mantainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>

pkgname=system-config-users
pkgver=1.3.8
pkgrel=1
pkgdesc='A graphical interface for administering users and groups'
arch=('i686' 'x86_64')
url='https://than.fedorapeople.org/system-config-users'
license=('GPL')
depends=('libselinux-python2' 'libuser' 'python2' 'python2-rpm' 'selinux-python2'
         'rpm-tools' 'xdg-utils')
makedepends=()
source=('system-config-users::git+https://gitlab.com/tallero/system-config-users.git#commit=dabb1f8b')
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
