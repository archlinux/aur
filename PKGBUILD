# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>

pkgname=libcelero-headers
_pkgname=Celero
pkgver=2.4.0
pkgrel=1
pkgdesc='C++ Benchmark Authoring Library/Framework (Developmental Headers)'
arch=('any')
url='https://github.com/DigitalInBlue/Celero'
license=('custom:"Apache License, Version 2.0"')
source=("https://github.com/DigitalInBlue/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('dbbe80a06a203dcc3865879f51e4da0feffbc0cb953a91d4c798a5582962ec41')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "include/celero/"
  mkdir -p "${pkgdir}/usr/include/celero/"
  install -Dm644 *.h "${pkgdir}/usr/include/celero/"
}
