# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.69.1
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
sha256sums_x86_64=('e906e646482269400d11545fdfef4be37708923f0bbaee31dc36224f01d40136')
sha256sums_aarch64=('e317812b5ae1119d1fb97e4b50d2cabd1a58e96c760a96f9f745b87b5c8102b7')
sha256sums_armv7h=('648957f836d295529114c9d69c902aa9c1b83d80c9d7f37c1cbbc9b794f9d3ba')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
