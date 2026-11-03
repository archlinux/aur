# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.69.0
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
sha256sums_x86_64=('8456524650ea7e35480738786121013d2af8aaf77156e2a98df96a66368d6915')
sha256sums_aarch64=('87719674293679dab3218886355a6cddf4711caff5d304bff5618c731b11931b')
sha256sums_armv7h=('34a9f205116c53291b9eba02cf294f2b40d28e6a60024711c6e08505d66f4670')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
