# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=ismyarchverifiedyet
pkgver=0.1.1
pkgrel=1
pkgdesc='Experimental script to query rebuilderd for results'
url='https://github.com/kpcyrd/ismyarchverifiedyet'
arch=('any')
license=('GPL3')
depends=('python' 'python-requests')
source=(https://github.com/kpcyrd/${pkgname}/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/kpcyrd/${pkgname}/archive/v${pkgver}.tar.gz)
b2sums=('a0964363980a9390ae3793fe662662aa9dc472444c3b50480333e3fc4287b356fb0fadef49ec5bb0f5af522501ce27bd245b4bc79dd2ae646f4d3fa8dd239907')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 ismyarchverifiedyet.py "${pkgdir}/usr/bin/ismyarchverifiedyet"
}

# vim: ts=2 sw=2 et:
