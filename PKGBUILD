# Maintainer: YSTYLE <lxy5266@live.com>
pkgname=kaf-cli
pkgver=v1.1.11
pkgrel=1
epoch=
pkgdesc="把txt文本转成epub与mobi电子书的命令行工具"
arch=('x86_64')
url="https://github.com/ystyle/TmdTextEpub"
license=('MulanPSL')
depends=('kindlegen')
source=("https://github.com/ystyle/TmdTextEpub/releases/download/$pkgver/TmdTextEpub-linux.zip")
md5sums=('2ac610ff453fba4a0568bc3a10527565')

package() {
    install -Dm755 TmdTextEpub-linux "$pkgdir/usr/bin/kaf-cli"
}
