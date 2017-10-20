# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=dextra
pkgver=1.38.114
pkgrel=2
pkgdesc='A tool for DEX and OAT dumping, decompilation, and fuzzing'
arch=('i686' 'x86_64' 'armv7h')
url='http://newandroidbook.com/tools/dextra.html'
license=('unknown')
source=("http://newandroidbook.com/files/${pkgname}.tar")
sha256sums=('7e4bfc90a50d2e96a5d1bd06557e35194204b3f85a9bbaade2b2942d088ea1ea')

package() {
  case "${CARCH}" in
    i686) install -Dm755 "${srcdir}"/dextra "${pkgdir}"/usr/bin/dextra ;;
    x86_64) install -Dm755 "${srcdir}"/dextra.ELF64 "${pkgdir}"/usr/bin/dextra ;;
    armv7h) install -Dm755 "${srcdir}"/dextra.armv7 "${pkgdir}"/usr/bin/dextra ;;
  esac
}
