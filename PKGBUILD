# Maintainer: YSTYLE <lxy5266@live.com>

pkgname=kaf-cli
pkgver=v1.3.13
pkgrel=1
epoch=
pkgdesc="把txt文本转成epub与mobi电子书的命令行工具"
arch=('x86_64' 'aarch64' 'loong64')
url="https://github.com/ystyle/kaf-cli"
license=('MulanPSL')
optdepends=('kindlegen: 在x86_64上用于生成标准的mobi格式')
source_x86_64=("https://github.com/ystyle/TmdTextEpub/releases/download/$pkgver/kaf-cli_${pkgver}_linux_amd64.zip")
source_aarch64=("https://github.com/ystyle/TmdTextEpub/releases/download/$pkgver/kaf-cli_${pkgver}_linux_arm64.zip")
source_loong64=("https://github.com/ystyle/TmdTextEpub/releases/download/$pkgver/kaf-cli_${pkgver}_linux_loong64.zip")
sha512sums_x86_64=('b9a00de2501e25e1cb44de80851f6ca6f13f405f0fbc413e57e70e52f42084bf6cb5a97d5e94afee841876cdae23640d6d34a8269939c0ef7522a14eeb1c6a48')
sha512sums_aarch64=('32a954f06348d20f92855efd23ab00a2493e31cfed36b64933d342ef510da4ae25d2734e01f44c50650bb624cb861262652e03a1a58484492157c91672cf4cf6')
sha512sums_loong64=('57e1629220dff909e86ebd1ba8976f81c947d8e03f5cb292a3a3ec66ff0f81effd0b15d8e2c6b6010b687faceca84a9e2028758b5f86ba06748aac29469fb749')

package() {
    install -Dm755 kaf-cli "$pkgdir/usr/bin/kaf-cli"
}
