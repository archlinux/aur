# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.63.3
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
sha256sums_x86_64=('ddcd0619afe62518eb8ef2d413f5d0d5e1acd699c37e1694c2ee3279ec6a5382')
sha256sums_aarch64=('9bcd598c20e457bbcdb117517a503289c1a45b0af52054ae5bb3995d18c1897e')
sha256sums_armv7h=('7332c24936703c5b6947b63103df82dd0984679b92ffce604d3f3f782fd7adb3')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
