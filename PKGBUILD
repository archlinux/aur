# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=ismyarchverifiedyet
pkgver=0.1.0
pkgrel=1
pkgdesc='Experimental script to query rebuilderd for results'
url='https://github.com/kpcyrd/ismyarchverifiedyet'
arch=('any')
license=('GPL3')
depends=('python' 'python-requests')
source=(https://github.com/kpcyrd/${pkgname}/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/kpcyrd/${pkgname}/archive/v${pkgver}.tar.gz)
b2sums=('763d93274ea024e0451f8740b4e9798d043554347ed2bacfff2b040278535baaea1b3beae332a4fe0fb15e5e603e4639002484b8944bc1e13750dc9c09c3b779')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 ismyarchverifiedyet.py "${pkgdir}/usr/bin/ismyarchverifiedyet"
}

# vim: ts=2 sw=2 et:
