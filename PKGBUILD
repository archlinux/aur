# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.62.0
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
sha256sums_x86_64=('3ddad0cf975dff6662d80efba4d549f16279cc99874cdc571d140b60b5b5c725')
sha256sums_aarch64=('232493a1a00b128b1f76d6ec3a26d08c6e137988b0e4fd4a1f0b9632f5ff69d5')
sha256sums_armv7h=('b1ca589847b0d0e0629dc6875fe67577b92f522bc578d35eed0cfdec3c11a983')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
