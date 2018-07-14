# Maintainer: Pawel Dzieciolowski <dzieciolowski dot pawel at gmail dot com>

pkgname=squeue
pkgver=1.0.1
pkgrel=1
pkgdesc='Simple queue implementation based on Screen command'
arch=('any')
url='https://github.com/dzieciolowski/squeue'
license=('MIT')
depends=('screen' 'coreutils' 'bash' 'sed')
source=("${pkgname}-${pkgver}.zip::https://github.com/dzieciolowski/${pkgname}/archive/v${pkgver}.zip")
sha256sums=('bf17b9eb4e982f5f6934d1eb0a45f7d1cfc6eeeb55fce8c85311bcf548415509')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm 755 squeue "${pkgdir}/usr/bin/squeue"
}
