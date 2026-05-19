# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.64.4
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
sha256sums_x86_64=('f4de1e2d9001d336386b6e4bca78149ba35f2f43dc606b9e09751ac85883045b')
sha256sums_aarch64=('9c31844423b7fbfdd4044d9ff3d52efe94cf7093f1f7e37099f214f3f9e401a2')
sha256sums_armv7h=('00adad3a44d70856a860ec3828fcfe97a8ab2b66fa1d0831c69a9fd592a1276e')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
