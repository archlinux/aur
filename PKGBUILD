# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.63.4
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
sha256sums_x86_64=('92f1a16e7e76c15399520e9ebba669b1fa4ea781460ebd6e32eb298df03c9da2')
sha256sums_aarch64=('e46a84018b1d94286c4d03d20a70b1f1d1ea17455517b09fe9c7298e84fd2601')
sha256sums_armv7h=('d1c87cef641c591599b00a82b496753178b267ece1cf12d933ea0ecb14b04bf6')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
