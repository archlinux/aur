# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.60.1
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
sha256sums_x86_64=('8628ce4487c0c18f82461b9b805433c536ce55bd963ba9e6364419eac86f23af')
sha256sums_aarch64=('cf146b3d7b06f029b921950cff831c78bb8025d76e193ba08755ded6b0a44bff')
sha256sums_armv7h=('89be1625faaa4e23d6e1f2c4f568f99913fb7149d56b5984d250711dd6e2b109')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
