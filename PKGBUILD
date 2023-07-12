# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="music-dl-bin"
pkgver=3.5.4
pkgrel=1
pkgdesc="Music Searcher and Downloader. - 音乐搜索下载器。"
arch=("x86_64")
url="https://github.com/guanguans/music-dl"
license=('MIT')
depends=('php')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}::https://github.com/guanguans/music-dl/raw/master/builds/music-dl"
    "LICENSE::https://raw.githubusercontent.com/guanguans/music-dl/master/LICENSE")
sha256sums=('dfee151ac96a620410ef924cb9cb0a87ea8fc23c0fb42d3de1a13bfdbeba675b'
            '57d9689723f779c562e62ddb5f5f4393fbf41b16bd677096c9623c82a0d4aa19')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}