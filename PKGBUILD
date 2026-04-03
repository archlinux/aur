# Maintainer: YSTYLE <lxy5266@live.com>

pkgname=kaf-cli
pkgver=v1.3.15
pkgrel=1
epoch=
pkgdesc="把txt文本转成epub与mobi电子书的命令行工具"
arch=('x86_64' 'aarch64' 'loong64')
url="https://github.com/ystyle/kaf-cli"
license=('MulanPSL')
optdepends=('kindlegen: 在x86_64上用于生成标准的mobi格式')
source_x86_64=("https://github.com/ystyle/kaf-cli/releases/download/$pkgver/kaf-cli_${pkgver}_linux_amd64.zip")
source_aarch64=("https://github.com/ystyle/kaf-cli/releases/download/$pkgver/kaf-cli_${pkgver}_linux_arm64.zip")
source_loong64=("https://github.com/ystyle/kaf-cli/releases/download/$pkgver/kaf-cli_${pkgver}_linux_loong64.zip")
sha512sums_x86_64=('dbc1cdcbd2649aa98e40b9b51c0cdca1e3a00427bbf5dca3d07a5b11f361f56812c6d3c626d20f18d48248e5c82d412b731487b0e9caeb1d120e87e064e4ae45')
sha512sums_aarch64=('c13fb876cefe7a44cf5ffa526ddc8ca24cfecab52311b9f66fa04c1196cc0d70a95f095ffd895603f1db09fcc54d7240f2eaf71b08c562efb544cfe714384fb1')
sha512sums_loong64=('da3e14bee5231a211bcaf8a1658dc2aa84d8f0b20d2da8feba13388c3234bbb4e759c39963e507a0b23ee16e86fa306252bbf587cdf1b2da9009a0a7dd1a420a')

package() {
    install -Dm755 kaf-cli "$pkgdir/usr/bin/kaf-cli"
}
