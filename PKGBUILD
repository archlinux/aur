# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.64.1
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
sha256sums_x86_64=('03d91978dce5520353be9aa0ddd33f2dea842af257fb1fa3a0f6b98b00496e31')
sha256sums_aarch64=('b9dcd928517dd1677143fe9c6713a73a3fbaca313a3f4db56e079cd41201d24a')
sha256sums_armv7h=('d6c37a75dedddc95086710320329816638dd762846ab6868a7bda5dafe95980a')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
