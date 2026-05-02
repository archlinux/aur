# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.64.2
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
sha256sums_x86_64=('e96239b4ab1e25ad796c148c6d1a8418349821b714fcbb45070a49d9c251afe8')
sha256sums_aarch64=('3f88d2f838c9d59e7dd96050b7e2345dad1db4e91cf488cff23f25bd4249547c')
sha256sums_armv7h=('bb8e9125f714f884c906b942e0183a8d7cf04d735a9d4c254de19378e1582288')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
