# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.58.0
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
sha256sums_x86_64=('5f45853d00648e14ffd1e8fe7e47e88fcc16815d2ee7d65a5eb73718eaa851cd')
sha256sums_aarch64=('cdbb9d86c4efcfee2ff4350ebfa91eef68ed871353e42f3880f8c2de061b3096')
sha256sums_armv7h=('8471e67c98320e1984aff8a9704c895b9b64a4172720a9affcb07f3349ac71d8')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
