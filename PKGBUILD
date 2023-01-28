# Maintainer: YSTYLE <lxy5266@live.com>

pkgname=kaf-cli
pkgver=v1.2.11
pkgrel=2
epoch=
pkgdesc="把txt文本转成epub与mobi电子书的命令行工具"
arch=('x86_64' 'aarch64')
url="https://github.com/ystyle/kaf-cli"
license=('MulanPSL')
optdepends=('kindlegen: 在x86_64上用于生成标准的mobi格式')
source_x86_64=("https://github.com/ystyle/TmdTextEpub/releases/download/$pkgver/kaf-cli_${pkgver}_linux_amd64.zip")
source_aarch64=("https://github.com/ystyle/TmdTextEpub/releases/download/$pkgver/kaf-cli_${pkgver}_linux_arm64.zip")
sha512sums_x86_64=('bfd8d9599227b5615db01e4c6769d8086bede938abca3bafa879e2914afeee6e19157fa290f5cfa0aec9413663dde601bd6c0fb02e38db60b723b82d5f06df4a')
sha512sums_aarch64=('2c60d297ac18b698e9c6e9a03deb7b3c6d3f2e339989bcd51f9c91bf292f7b959015fdfa2f3fe2513fab91ba3dff039c35e0e2e25b648b7713bb1ea5c0871cb5')

package() {
    install -Dm755 kaf-cli "$pkgdir/usr/bin/kaf-cli"
}
