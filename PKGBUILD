# Maintainer: Haotian Li <lilinzta@gmail.com>
pkgname=copymanga-downloader-bin
pkgdesc="拷贝漫画 copymanga 的多线程下载器"
pkgver=0.3.2
pkgrel=1
arch=('x86_64')
url="https://github.com/lanyeeee/copymanga-downloader"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
source=("https://github.com/lanyeeee/copymanga-downloader/releases/download/v${pkgver}/copymanga-downloader_${pkgver}_linux_amd64.deb")
sha256sums=('4f9072d388d5d2f221d145e1ed178b496866ae0b1ef3cc2d6c7c6b7dde020d83')

package() {
    tar -zxf data.tar.gz -C "${pkgdir}/"
    chown -R root:root "${pkgdir}"
}
