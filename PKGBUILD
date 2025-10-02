# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.60.0
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
sha256sums_x86_64=('13c883999bcf3fbd1cfc36a4f45059d3a7ccdb88283285a1b79d06872184ac68')
sha256sums_aarch64=('aa0d1230e99d0abc794e30f8cbf22299c001afbee55ab9cbdfd2e789f787f02f')
sha256sums_armv7h=('31ba724c79253ab7a60b0995007a85b962a4324376512f57a2d7160197cb8d15')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
