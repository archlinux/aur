# Maintainer: YSTYLE <lxy5266@live.com>
pkgname=kaf-cli
pkgver=v1.1.12
pkgrel=1
epoch=
pkgdesc="把txt文本转成epub与mobi电子书的命令行工具"
arch=('x86_64')
url="https://github.com/ystyle/kaf-cli"
license=('MulanPSL')
depends=('kindlegen')
source=("https://github.com/ystyle/TmdTextEpub/releases/download/$pkgver/kaf-cli-linux.zip")
md5sums=('2e574717dbd148425b744254f7679c35')

package() {
    install -Dm755 kaf-cli-linux "$pkgdir/usr/bin/kaf-cli"
}
