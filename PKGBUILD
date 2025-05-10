# Maintainer: YSTYLE <lxy5266@live.com>

pkgname=kaf-cli
pkgver=v1.3.11
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
sha512sums_x86_64=('2ced630dc9c4a915a0b716e0e8c7158de77f9523feeb5f9bc7b2eb8c010a2407853731217c24c3cb08b3743d39acfeba1cede08b4cb564f7a6f3cbb627386cbc')
sha512sums_aarch64=('5c14c91a1b3f98e0e9264a7ea0f553e18019b527d49f0a19446c52e5840ddebdd1b0412904ad531f2455206d37c3ff7a6417286480dd5228caad1424564631a1')
sha512sums_loong64=('90166f8b3c55691db43ff553cb277e7c9719b78afa2ed863e919ced946e142a09a1334ef322ac5abce48158e2efbdaf06138769792eda1daa2c723008f4ebf85')

package() {
    install -Dm755 kaf-cli "$pkgdir/usr/bin/kaf-cli"
}
