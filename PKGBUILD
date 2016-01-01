# Maintainer: David Manouchehri <manouchehri@riseup.net>

pkgname="visual"
pkgver=1.27
pkgrel=1
pkgdesc="A highly visual ARM emulator, designed to make learning ARM Assembly language easier."
url="http://salmanarif.bitbucket.org/visual/"
license=('unknown')
source=("http://bit.ly/visuallinux_127_amd64")
# http://bit.ly/visuallinux_127_i386
sha512sums=('SKIP')
arch=('x86_64') # arch=('i686' 'x86_64')
# depends=('java-runtime')

package() {
  cd "${srcdir}/"
  tar -xvf 'data.tar.xz' -C "${pkgdir}/"

  # The bundled JRE is less than ideal, but it's required at the moment.
  # sed -i 's,../jre/bin/java,java,' "${pkgdir}/usr/local/bin/visual/VisUAL.sh"
  # rm -r "${pkgdir}/usr/local/bin/visual/jre/"
}

# vim:set et sw=2 sts=2 tw=80: