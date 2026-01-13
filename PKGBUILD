# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.63.1
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
sha256sums_x86_64=('334c63b828e86003368152631bcd9d43f92296b082bcd0d070684d9fa9c1b232')
sha256sums_aarch64=('28558d66e804dfc8bcc2834d71e313378eaec5a51d8674b11da9935ac51b3fd4')
sha256sums_armv7h=('1d8c280cb27752a042462be0373eed8fff636253afcbcefe943019421aac9b5d')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
