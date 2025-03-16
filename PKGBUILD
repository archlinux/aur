# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.49.0
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
sha256sums_x86_64=('29500ea5594c3cdf694aa836fa679d5b2e7b3724e2462443e72592595a4456d2')
sha256sums_aarch64=('eb02e6d003704afb3f57b3fc8bf3557375f79f78dae50cabb4a1706f8d657d9d')
sha256sums_armv7h=('be8435c9c310517275dc5c77d7cbf05fae5c586f8979dc59ac7c7ba89237e4c6')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
