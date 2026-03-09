# Maintainer: Arianne <arianne@arianne.dev>
# Maintainer: Elliott Fournier-Robert <elliott1447@gmail.com>

pkgname=octoberctl-bin
pkgver=1.2
pkgrel=1
sha256sums=('bc6be16420c345a68603e20e10f60b4b3cb6c02ac79e9160aed17d349c2d3a55')
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
