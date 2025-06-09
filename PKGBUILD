# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.56.1
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
sha256sums_x86_64=('cd95f6ef08ad493154ba64fa5a448165e8dd3b3df62770030881d41a67aa0d79')
sha256sums_aarch64=('b99e9e69d8c534cc7efea09022290a485e094429eaf47583e3998679d77c8c8d')
sha256sums_armv7h=('bb8756ac3003d445876ff3c17b1f8411c15c913b8e7eb7de9c3f298713df7a24')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
