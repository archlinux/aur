# Maintainer: Ivan Kuchukov <ivan.kuchukov[at]gmail[dot]com>
# Contributor: Ivan Kuchukov <ivan.kuchukov[at]gmail[dot]com>

pkgname='tdisk'
pkgver=0.1
pkgrel=3
pkgdesc='A command-line tool that show partitions as graphs'
arch=('x86_64')
url='https://github.com/ivan-kuchukov/tdisk'
license=('unknown')
makedepends=('git')
checkdepends=('bash')
depends=('util-linux')
conflicts=()
provides=()
source=("${pkgname}::git+https://github.com/ivan-kuchukov/tdisk#branch=master")
md5sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}"
  cp tdisk "${pkgdir}/usr/bin"
}
