# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * No namcap warnings or errors

pkgname=libcelero-headers
_pkgname=Celero
pkgver=2.1.0
pkgrel=1
pkgdesc='C++ Benchmark Authoring Library/Framework (Developmental Headers)'
arch=('any')
url='https://github.com/DigitalInBlue/Celero'
license=('custom:"Apache License, Version 2.0"')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/DigitalInBlue/${_pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('41f36d4e43b1e6c0308dedb6c4e605a1')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "include/celero/"
  mkdir -p "${pkgdir}/usr/include/celero/"
  install -Dm644 *.h "${pkgdir}/usr/include/celero/"
}
