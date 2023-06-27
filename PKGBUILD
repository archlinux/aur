# Maintainer: YSTYLE <lxy5266@live.com>

pkgname=kaf-cli
pkgver=v1.3.0
pkgrel=1
epoch=
pkgdesc="把txt文本转成epub与mobi电子书的命令行工具"
arch=('x86_64' 'aarch64')
url="https://github.com/ystyle/kaf-cli"
license=('MulanPSL')
optdepends=('kindlegen: 在x86_64上用于生成标准的mobi格式')
source_x86_64=("https://github.com/ystyle/TmdTextEpub/releases/download/$pkgver/kaf-cli_${pkgver}_linux_amd64.zip")
source_aarch64=("https://github.com/ystyle/TmdTextEpub/releases/download/$pkgver/kaf-cli_${pkgver}_linux_arm64.zip")
sha512sums_x86_64=('bd48087aed71d31bf1c34d73c7dd7d86537620570032439c35a91434419008232622626d72053cea25ba89a75d79fb2effa4f39065b02e9ed7b1b54b1ad2524e')
sha512sums_aarch64=('c1762a6c84d2437967722e14146596d7302ee0fc9ed50ab1430bf7c6288e76a1251f77d90fa6c141d7ad25a8f8393aee856538414057e83c0ef47aaa0c72d241')

package() {
    install -Dm755 kaf-cli "$pkgdir/usr/bin/kaf-cli"
}
