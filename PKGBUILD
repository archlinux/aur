# Maintainer: Haotian Li <lilinzta@gmail.com>
pkgname=copymanga-downloader-bin
pkgdesc="拷贝漫画 copymanga 的多线程下载器"
pkgver=0.4.0
pkgrel=1
arch=('x86_64')
url="https://github.com/lanyeeee/copymanga-downloader"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
source=("https://github.com/lanyeeee/copymanga-downloader/releases/download/v${pkgver}/copymanga-downloader_${pkgver}_linux_amd64.deb")
sha256sums=('b5f67808c2f9e439990aa619aa6114df136795ebed545f46c1d8c6b53e9d5e9e')

package() {
    tar -zxf data.tar.gz -C "${pkgdir}/"
    chown -R root:root "${pkgdir}"
}
