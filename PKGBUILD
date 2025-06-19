# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.56.2
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
sha256sums_x86_64=('24d1926e74d72cdd6418e86158d744f418aa40d8c9ec23748deaec968da755cb')
sha256sums_aarch64=('92a57e5a3b30dfb3b6a8491023ac89cb8fe1c1a5a4682e514ac37b66846432e2')
sha256sums_armv7h=('601360cf417318a1329aa5b566f74377f0c8939255ec6a5e177985cc058a970f')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
