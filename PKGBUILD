# Maintainer: Nelson Lee <skyli at skyli dot xyz>

pkgname=echowarp-bin
pkgver=0.9.1
pkgrel=1
pkgdesc='Prebuilt binary of EchoWarp, real-time network audio streaming between hosts'
arch=('x86_64')
url='https://github.com/lHumaNl/EchoWarp'
license=('MIT')
provides=('echowarp')
conflicts=('echowarp')
source=(
    'EchoWarp_linux_amd64.tar.gz::https://github.com/lHumaNl/EchoWarp/releases/download/0.9.1/EchoWarp_linux_amd64.tar.gz'
    'echowarp-LICENSE::https://raw.githubusercontent.com/lHumaNl/EchoWarp/0.9.1/LICENSE'
)
sha256sums=(
    '7c194084da45733e9aaf47c3041dd9447f10d85e584f039bb9a0da2beb242b30'
    'f910cd558625f0a252e60463e903784d3c3a896f118e0ef6a429a2dffbe73f00'
)

package() {
    install -Dm755 EchoWarp "$pkgdir/usr/bin/echowarp"
    install -Dm644 echowarp-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
