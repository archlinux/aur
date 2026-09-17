# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.67.0
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
sha256sums_x86_64=('cf4e048022bd971b874c8acebc82a4eb2a0cc114c2bd8d666c5b67891a0c46cb')
sha256sums_aarch64=('58a13292356215f2093c9e5dc0bbf858ecf370d8df679433f9849b9f6462ea72')
sha256sums_armv7h=('9feb4def5db69ea018f733a9bf4b111eb9de3c8437ddf97ed582bd94267ab592')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
