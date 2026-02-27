# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.64.0
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
sha256sums_x86_64=('cc712ab3d1836e38a6594f6b96c764a6b44b8aab49728c70d626fd8a64767b95')
sha256sums_aarch64=('555a6d01fec6a487833c746e5809e1af8cf872776c22c0db6d48c6200bbd347c')
sha256sums_armv7h=('065f951bda207f4c7e96bd13f470bd10ccb6740f0bd9e701a8bdb2da82f714e1')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
