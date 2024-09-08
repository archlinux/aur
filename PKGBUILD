# Maintainer: Jacob P kubaszek10puchacz@gmail.com
pkgname=zypper-dup
pkgver=1.0
pkgrel=1
pkgdesc="A dummy package that replaces 'sudo zypper dup' with a dangerous command"
arch=('any')
license=('GPL')
conflicts=('zypper') # Optional: to avoid conflicts with existing commands
provides=('zypper')
source=("mycommand.sh")
sha256sums=('SKIP') # Use the correct checksum for your script file

package() {
  install -Dm755 "${srcdir}/mycommand.sh" "${pkgdir}/usr/bin/zypper"
}
