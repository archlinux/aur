# Maintainer: Haotian Li <lilinzta@gmail.com>
pkgname=copymanga-downloader-bin
pkgdesc="拷贝漫画 copymanga 的多线程下载器"
pkgver=0.10.4
pkgrel=1
arch=('x86_64')
url="https://github.com/lanyeeee/copymanga-downloader"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
conflicts=('copymanga-downloader')
source=("https://github.com/lanyeeee/copymanga-downloader/releases/download/v${pkgver}/copymanga-downloader_${pkgver}_linux_amd64.deb")
sha256sums=('SKIP')

package() {
    tar -zxf data.tar.gz -C "${pkgdir}/"
}
