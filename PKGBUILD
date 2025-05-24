# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.55.0
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
sha256sums_x86_64=('4420db301a86bacf5d61d5f5e196c7e278e14310e30a8307200e387fcc16eb50')
sha256sums_aarch64=('9ebe4ec6103ba9de8650dbadc35a9c14e44f2fe8b70e0c43d9e19f4d8e0cf853')
sha256sums_armv7h=('f85094c3f852895adb9fc4acd28ba35b95481c93d4c31932ab62fd885bc88992')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
