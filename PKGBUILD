# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=3.63.2
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
sha256sums_x86_64=('31eb1d40a4128d21562f64cfd0350b300d64a55f9e3b75f03c57dc751effdb14')
sha256sums_aarch64=('0b9e91a2b2c580b4dd24291a00d04f7406c9b6258b889047e0f68e8a281e479f')
sha256sums_armv7h=('d14cd0d11420ea05a7802b69608c26e13792bd4c5f4aabe7e23857d0f661ab74')

package() {
  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
