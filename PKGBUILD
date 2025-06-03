# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.56.0
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
sha256sums_x86_64=('52bb36793d07fcc3b0c35a1df2bbdd46ec53e48901bb5afe409045cc462e2f51')
sha256sums_aarch64=('823ef64dacf15a01ff1f9f04c1a63d86b3f1dcf1cc68153d3ea4f6068ba01d7e')
sha256sums_armv7h=('40025c3a9219288605b0b2fc5f7acea39a3e6f70242578a812ae130a82d00238')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
