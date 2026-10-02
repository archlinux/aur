# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.68.3
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
sha256sums_x86_64=('ec43c22b2a433a3f6da87006b281451d8cd5bab5eb25047f7a671dfbeebc15a4')
sha256sums_aarch64=('fb00dd0649a112be4ce1ce2802f14c0177e2a00887b3ab57f7d978e3d69f4b12')
sha256sums_armv7h=('923d023739acb2c9a7848faa13aa74ca0a739876a366cda3741b2dc553a2ee81')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
