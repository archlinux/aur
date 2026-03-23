# Maintainer: Arianne <arianne@arianne.dev>
# Maintainer: Elliott Fournier-Robert <elliott1447@gmail.com>

pkgname=octoberctl-bin
pkgver=1.3
pkgrel=1
sha256sums=('17044fe2d583dcc4162f8fd62c67ba7253c642e5f43808337c35c6853df6ae3e')
depends=(
    'git'
)

url='https://github.com/october-os/octoberctl'
pkgdesc='The official October Linux management utility'
arch=('x86_64')
license=('GPL-3.0-or-later')

_asset_name="octoberctl"
source=("${_asset_name}::https://github.com/october-os/octoberctl/releases/download/${pkgver}/${_asset_name}")

package() {
    install -d "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/${_asset_name}" "${pkgdir}/usr/bin/${_asset_name}"
}
