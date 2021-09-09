# Maintainer: YSTYLE <lxy5266@live.com>
pkgname=kaf-cli
pkgver=v1.2.1
pkgrel=1
epoch=
pkgdesc="把txt文本转成epub与mobi电子书的命令行工具"
arch=('x86_64')
url="https://github.com/ystyle/kaf-cli"
license=('MulanPSL')
depends=('kindlegen')
source=("https://github.com/ystyle/TmdTextEpub/releases/download/$pkgver/kaf-cli-linux.zip")
md5sums=('fe275c95ff0ef446c29e6bb939ba1e7f')

package() {
    install -Dm755 kaf-cli-linux "$pkgdir/usr/bin/kaf-cli"
}
