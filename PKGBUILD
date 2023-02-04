# Maintainer: YSTYLE <lxy5266@live.com>

pkgname=kaf-cli
pkgver=v1.2.12
pkgrel=2
epoch=
pkgdesc="把txt文本转成epub与mobi电子书的命令行工具"
arch=('x86_64' 'aarch64')
url="https://github.com/ystyle/kaf-cli"
license=('MulanPSL')
optdepends=('kindlegen: 在x86_64上用于生成标准的mobi格式')
source_x86_64=("https://github.com/ystyle/TmdTextEpub/releases/download/$pkgver/kaf-cli_${pkgver}_linux_amd64.zip")
source_aarch64=("https://github.com/ystyle/TmdTextEpub/releases/download/$pkgver/kaf-cli_${pkgver}_linux_arm64.zip")
sha512sums_x86_64=('7ffb5e1ae28307289f10631ba2182053a85c5e4f26f0dabbdce95454e10b510b9b9b93f6c7fe993792f8831c47611b6d1e79b9bf5ea3ca116525c5892c77cc4c')
sha512sums_aarch64=('992b745eb5b551c1aae3955dcecf4e04e13a98b4774d6c5012bf7a1343f2f9a6edb3e143ccb913e472129fd50e4e1489c293600e61eccbc3bd3d19673e171537')

package() {
    install -Dm755 kaf-cli "$pkgdir/usr/bin/kaf-cli"
}
