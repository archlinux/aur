# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgname=selinux-dbus-config
_pkgname=selinux-dbus
pkgver=2.7
pkgrel=1
pkgdesc="SELinux GUI tools"
groups=('selinux')
arch=('any')
url='https://github.com/SELinuxProject/selinux/wiki'
license=('GPL2')
depends=('python' 'selinux-python')
conflicts=('policycoreutils<2.7')
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20170804/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a7f3dbe68c0d02cd1cbe6aac06e87c2957668cb88083389654fabacb79641ae4')

=build() {
  cd "${_pkgname}-${pkgver}"
  make=
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
