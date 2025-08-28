# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.57.0
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
sha256sums_x86_64=('6b07acf223036f95d49c034abcb3051c7887fe00bc5e60126b1fbbd02d9b92ec')
sha256sums_aarch64=('2bdff0291a061c7cc114a5c2ad91273ab1eed8d60b22ca4a245d3ca0d65ead0b')
sha256sums_armv7h=('cfd16c5803492af911e6ec0095eb748bff8dad72cf98b44548b460201b5d8104')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
