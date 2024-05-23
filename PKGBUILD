# Maintainer: strifel <me@strifel.de>

_name=decker
pkgname=${_name}-bin
pkgver=0.13.4
pkgrel=1
pkgdesc='Decker is used to create interactive webpresentations.'
arch=('x86_64')
url='https://decker.cs.tu-dortmund.de/'
license=('gpl-3.0')
provides=("${_name}")
conflicts=("${_name}")

source_x86_64=("https://github.com/decker-edu/decker/releases/download/v${pkgver}/decker-v${pkgver}-Linux-X64")
sha256sums_x86_64=('2d9d23d97d3308ff57b16825738f3c9cbdb9c375665a1fd36312b5c7a2bac8e2')
noextract=("decker-v${pkgver}-Linux-X64")

package() {
  install -Dm755 "${srcdir}/decker-v${pkgver}-Linux-X64" "${pkgdir}"/usr/bin/decker
}

