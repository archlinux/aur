# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.59.0
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
sha256sums_x86_64=('46900b73dca6fbd597b3db705cec4c892bc83b55c2821b47bf9bb3cf102f1e79')
sha256sums_aarch64=('86b1b8e1487d9c6de12b100d44a942a605a35482ccc972c8ada9785a91851eeb')
sha256sums_armv7h=('85d3cfc180e1bb5dca3e31c7b3227717fced841da621eea8af460645083d616b')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
