# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.66.0
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
sha256sums_x86_64=('65a361f164cc5075b7ecd947b355cd6ae19680f9eea32d52cba441d4bf2677f9')
sha256sums_aarch64=('de6a23b2cd06af8caaa85603531a9229bdc601cbf84557d50cb8269ec1652a4c')
sha256sums_armv7h=('f3547a46420a5b186c039f889cc47743ef89faa5a3c7ff34571d8f50d3599c67')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
