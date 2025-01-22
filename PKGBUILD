# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.44.0
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
sha256sums_x86_64=('57a3dbb81ccde4bbfb4f850422d92e6d4392dcf76af84ea317134ab6097e0999')
sha256sums_aarch64=('b57d6971ef4f49b34f0eb9cc193c90302ada4e6eeb82cf5c8ab8137d7a4ad3a5')
sha256sums_armv7h=('a50bb733459646d8267aceeef71f7d15d7a89c2803f6bd414a1f051791ffcacd')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
