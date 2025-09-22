# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.59.1
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
sha256sums_x86_64=('88eb844325fd854eba51c47c464fe366976c67424b87bf86fb7ab617dcca539a')
sha256sums_aarch64=('46ae9b73063a4398b86eff09b35b269bcf805b144d8720c06d2fdb07db5cc50a')
sha256sums_armv7h=('99e96cb85aa5902f5c13cc9be5738fcf499f272bf6c769b01fd7d94ef7b8c778')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
