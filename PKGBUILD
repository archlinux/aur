# Maintainer: YSTYLE <lxy5266@live.com>

pkgname=kaf-cli
pkgver=v1.2.10
pkgrel=1
epoch=2
pkgdesc="把txt文本转成epub与mobi电子书的命令行工具"
arch=('x86_64' 'aarch64')
url="https://github.com/ystyle/kaf-cli"
license=('MulanPSL')
optdepends=('kindlegen: 在x86_64上用于生成标准的mobi格式')
source_x86_64=("https://github.com/ystyle/TmdTextEpub/releases/download/$pkgver/kaf-cli_${pkgver}_linux_amd64.zip")
source_aarch64=("https://github.com/ystyle/TmdTextEpub/releases/download/$pkgver/kaf-cli_${pkgver}_linux_arm64.zip")
sha512sums_x86_64=('6a5efbcd78e1a9dea5b71228c7a05ba9e2a97414d7b80b464f745d19bf91263017e61f24b287e3f55f64be77e898ac09decb465c59d7ba3aea64e5a06155152c')
sha512sums_aarch64=('0ad9262d6036bd0a291366886a263ea6b9a639ade77307d2a3f850f44c2752d6b1cf7bd5d5b3357f0a566a57b12db4cd333ffb6ef21bbbf4cdfd9157c11582f5')

package() {
    install -Dm755 kaf-cli "$pkgdir/usr/bin/kaf-cli"
}
