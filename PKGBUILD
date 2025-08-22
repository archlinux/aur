# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.56.4
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
sha256sums_x86_64=('66c78c9e66c97ce69808d04c22faf328756afabbfab06ce9df430039c35f50b8')
sha256sums_aarch64=('2301fd61ed0a345d2baab10cabac549886ff1045d139e7fcd646905b4fdeedb2')
sha256sums_armv7h=('4174f4c0b3b167bfa82d1a7bae64d1778ce6c786b7fc1d463cb4d4f1da733fd2')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
