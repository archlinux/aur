# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=linuxqq
pkgver=2.0.0
pkgrel=1
pkgdesc='QQ for Linux'
arch=('x86_64' 'aarch64' 'mips64el')
url='https://im.qq.com/linuxqq/download.html'
license=('custom')
source=(
    'https://qd.myapp.com/myapp/qqteam/linuxQQ/linuxqq_'${pkgver}'-b1-1024_'${arch}'.rpm'
)
md5sums=(
    'b72ca96b56cbb821182610263fa61145'
)
[ "$CARCH" = "aarch64" ] && md5sums=(
    'f37c3d05edc3764cf7837354971f5656'
)
[ "$CARCH" = "mips64el" ] && md5sums=(
    '07a8da26d708c3fe9bb1d7c9e1d9ae4e'
)

package() {
    mv ${srcdir}/usr/ ${pkgdir}/
}
