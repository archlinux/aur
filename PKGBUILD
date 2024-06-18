# Maintainer: strifel <me@strifel.de>

_name=decker
pkgname=${_name}-bin
pkgver=0.14.0.rc2
pkgrel=1
pkgdesc='Decker is used to create interactive webpresentations.'
arch=('x86_64')
url='https://decker.cs.tu-dortmund.de/'
license=('gpl-3.0')
provides=("${_name}")
conflicts=("${_name}")
options=(!strip)
_realver=$(echo "${pkgver}" | sed 's/\.\([^.]*\)$/-\1/')

source_x86_64=("https://github.com/decker-edu/decker/releases/download/v${_realver}/decker-v${_realver}-Linux-X64")
sha256sums_x86_64=('a1833b8f01135be57d547c08f91f227b31c2a9b6f5403cdd6ae72a0e2a5d9c22')
noextract=("decker-v${_realver}-Linux-X64")

package() {
  install -Dm755 "${srcdir}/decker-v${_realver}-Linux-X64" "${pkgdir}"/usr/bin/decker
}

