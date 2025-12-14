# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.62.2
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
sha256sums_x86_64=('1212da6aff924c35eb22da9428cd9637d2980e123fca254ee8ffe3411bc507e5')
sha256sums_aarch64=('33ad41c0fbe71ec6c62425d381b74b98cb8a0b5fbf03699ff5823f2db726de8d')
sha256sums_armv7h=('085fc4389bb0f8ee2416db68d7185447ec6abe2adb2aab86774e7869b6d0c7ab')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
