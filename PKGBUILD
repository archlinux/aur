# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>

pkgname=libcelero-headers
_pkgname=Celero
pkgver=2.5.0
pkgrel=1
pkgdesc='C++ Benchmark Authoring Library/Framework (Developmental Headers)'
arch=('any')
url='https://github.com/DigitalInBlue/Celero'
license=('custom:"Apache License, Version 2.0"')
conflicts=('libcelero')
provides=('libcelero')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/DigitalInBlue/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('1306444fb78ad1d33d6b9ed8ec94a1740b49fc98c3337dead15395255eda76a8')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "include/celero/"
  mkdir -p "${pkgdir}/usr/include/celero/"
  install -Dm644 *.h "${pkgdir}/usr/include/celero/"
}
