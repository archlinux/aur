# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="music-dl-bin"
pkgver=3.4.1
pkgrel=1
pkgdesc="Music Searcher and Downloader. - 音乐搜索下载器。"
arch=("x86_64")
url="https://github.com/guanguans/music-dl"
license=('MIT')
depends=('php')
provides=("guanguans")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}::https://github.com/guanguans/music-dl/raw/master/builds/music-dl"
    "LICENSE::https://raw.githubusercontent.com/guanguans/music-dl/master/LICENSE")
sha256sums=('9668016ff432e41673ec2f51f729a6b1b682af2fb0c1d1bdab9dc3c6723eee2e'
            '57d9689723f779c562e62ddb5f5f4393fbf41b16bd677096c9623c82a0d4aa19')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}