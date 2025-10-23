# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.61.0
pkgrel=1
arch=('x86_64' 'aarch64' 'armv7h')
url=https://github.com/ekristen/aws-nuke
license=('MIT')
provides=('aws-nuke')
conflicts=('aws-nuke')
_src="${url}/releases/download/v${pkgver}/aws-nuke-v${pkgver}-linux"
source_x86_64=("$_src"-amd64.tar.gz)
source_aarch64=("$_src"-arm64.tar.gz)
source_armv7h=("$_src"-arm7.tar.gz)
sha256sums_x86_64=('27d06905cc2168f203d956e33cbcc901dc6fce4ab49fd6c1365d30e5b297ddfc')
sha256sums_aarch64=('0e82a582cbd43d26d80a83bb28d472df2c99a6c8a2b3640ee81cd2a29c4418f7')
sha256sums_armv7h=('201850ba42ce915219b38692cf2507e5c5de9a89a18dd606f7081bf88057a927')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
