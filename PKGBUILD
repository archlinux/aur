# Maintainer: YSTYLE <lxy5266@live.com>

pkgname=kaf-cli
pkgver=v1.2.5
pkgrel=1
epoch=
pkgdesc="把txt文本转成epub与mobi电子书的命令行工具"
arch=('x86_64')
url="https://github.com/ystyle/kaf-cli"
license=('MulanPSL')
depends=('kindlegen')
source=("https://github.com/ystyle/TmdTextEpub/releases/download/$pkgver/kaf-cli_${pkgver}_linux_amd64.zip")
md5sums=('2d7933966747696793b0277fdf7c3ea2')

package() {
    install -Dm755 kaf-cli "$pkgdir/usr/bin/kaf-cli"
}
