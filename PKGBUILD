# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=hoverfly-bin
pkgver=1.5.2
pkgrel=1
pkgdesc="Lightweight service virtualization/API simulation tool for developers and testers"
arch=('x86_64')
url='https://hoverfly.io'
_githuburl="https://github.com/SpectoLabs/hoverfly"
license=('Apache')
provides=()
conflicts=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_bundle_linux_amd64.zip")
sha256sums=('03d4e205a23f4e5531bf72d5bca7b5582bdfc9a42a88fc6b364082ccbe22100c')

package() {
  install -Dm755 "${srcdir}/hoverctl" -t "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
}