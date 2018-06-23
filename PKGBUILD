# Maintainer: Pawel Dzieciolowski <dzieciolowski dot pawel at gmail dot com>

pkgname=squeue
pkgver=1.0.0
pkgrel=2
pkgdesc='Simple queue implementation based on Screen command'
arch=('any')
url='https://github.com/dzieciolowski/squeue'
license=('MIT')
depends=('screen' 'coreutils' 'bash')
source=("${pkgname}-${pkgver}.zip::https://github.com/dzieciolowski/${pkgname}/archive/v${pkgver}.zip")
sha256sums=('dbb1bd081d6cdd6c8c530704e69bf67045d2fe9f9d76470e23a0c503a8a9cf3a')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm 755 squeue "${pkgdir}/usr/bin/squeue"
}
