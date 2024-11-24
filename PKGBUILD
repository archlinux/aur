# Maintainer: Haotian Li <lilinzta@gmail.com>
pkgname=copymanga-downloader-bin
pkgdesc="拷贝漫画 copymanga 的多线程下载器"
pkgver=0.1.0
pkgrel=1
arch=('x86_64')
url="https://github.com/lanyeeee/copymanga-downloader"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
source=("https://github.com/lanyeeee/copymanga-downloader/releases/download/v${pkgver}/copymanga-downloader_${pkgver}_linux_amd64.deb")
sha256sums=('16c4efdd00a4f684f5451eeeb542af6a3943d33f3fea8203bed3903fe2f20a64')

package() {
    tar -zxf data.tar.gz -C "${pkgdir}/"
    chown -R root:root "${pkgdir}"
}
