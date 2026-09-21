# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.68.1
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
sha256sums_x86_64=('11cbce6eb4f3aceb816929d072a1efcfe0887ea198c4a9bea235bb991bbb2898')
sha256sums_aarch64=('302464e00e84fc7ae67b39341b0482fad45c8ca0aea099ae6c0d1a5ee3e89987')
sha256sums_armv7h=('b5dc379845171af2d60b28a3208ea84dad58dd91cac10ba071c8de3d0fceb5bc')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
