# Maintainer: Infernio <infernio at icloud dot com>
pkgname=sssm
pkgver=1.0.1
pkgrel=1
pkgdesc="Simple Steam Skin Manager"
arch=('any')
url="https://github.com/Infernio/sssm"
license=('MIT')
depends=('bash' 'steam')
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/Infernio/sssm/archive/${pkgver}.tar.gz")
sha256sums=('fd409aeb339de1f803def48256e3783c1eed3b9d004a8f72ff98de60e97a39bb')

package() {
    install -D -m755 "${srcdir}/${pkgname}-${pkgver}/sssm" "${pkgdir}/usr/bin/sssm"
}
