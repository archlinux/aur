# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.47.0
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
sha256sums_x86_64=('29682e8999c6984c2695711f65ce059405636dae14521c6bdafd5fd4e426df7d')
sha256sums_aarch64=('ee37f643d68e18138d466a66f9c3fe17ab7b6b19ba44547d0829772a209561fb')
sha256sums_armv7h=('5effc6d9db0c269342bfbf54ab941e5235fa2d355cf0fd4b5acc17facb727055')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
