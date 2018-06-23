# Maintainer: Pawel Dzieciolowski <dzieciolowski dot pawel at gmail dot com>

pkgname=squeue
pkgver=1.0.0
pkgrel=1
pkgdesc='Simple queue implementation based on Screen command'
arch=('any')
url='https://github.com/dzieciolowski/squeue'
license=('MIT')
depends=('screen' 'coreutils' 'bash')
source=("v${pkgver}.zip::https://github.com/dzieciolowski/${pkgname}/archive/v${pkgver}.zip")
sha256sums=('a7371389ec5790b8bd7f0279fe325efc02c00b2a04cb8f96778ef87df8275902')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm 755 squeue "${pkgdir}/usr/bin/squeue"
}
