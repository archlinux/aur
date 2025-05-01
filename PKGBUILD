# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.52.1
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
sha256sums_x86_64=('49de1a6554f241f123d1fa5e1d551ad9f33376275c87772e61e9cef962acdbd6')
sha256sums_aarch64=('6f630b14ca08c9ba27837fbd10f51174e1d5b0e419a15e961707067e4bef674b')
sha256sums_armv7h=('e146031954f1fbee44439a058cd6c3b5d13a1cd63dde40308d348c878f0db19e')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
