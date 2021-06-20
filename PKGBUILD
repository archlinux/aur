# Maintainer: YSTYLE <lxy5266@live.com>
pkgname=kaf-cli
pkgver=v1.2.0
pkgrel=1
epoch=
pkgdesc="把txt文本转成epub与mobi电子书的命令行工具"
arch=('x86_64')
url="https://github.com/ystyle/kaf-cli"
license=('MulanPSL')
depends=('kindlegen')
source=("https://github.com/ystyle/TmdTextEpub/releases/download/$pkgver/kaf-cli-linux.zip")
md5sums=('4b8e022d3e2be8acf12ca075f9f25b93')

package() {
    install -Dm755 kaf-cli-linux "$pkgdir/usr/bin/kaf-cli"
}
