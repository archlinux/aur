# Maintainer: YSTYLE <lxy5266@live.com>

pkgname=kaf-cli
pkgver=v1.3.4
pkgrel=1
epoch=
pkgdesc="把txt文本转成epub与mobi电子书的命令行工具"
arch=('x86_64' 'aarch64')
url="https://github.com/ystyle/kaf-cli"
license=('MulanPSL')
optdepends=('kindlegen: 在x86_64上用于生成标准的mobi格式')
source_x86_64=("https://github.com/ystyle/TmdTextEpub/releases/download/$pkgver/kaf-cli_${pkgver}_linux_amd64.zip")
source_aarch64=("https://github.com/ystyle/TmdTextEpub/releases/download/$pkgver/kaf-cli_${pkgver}_linux_arm64.zip")
sha512sums_x86_64=('dbbd607243941a1d4abb466d16d2b07e5dfebc3f22cc7fb84cec299112141437e0aaa3b7c915a10eb6c649aa0df634a1e08cc51e1962255c53f1977d816b4d9a')
sha512sums_aarch64=('1e214c16d1f3e460c3fa2cfddaac192b79636d8b2f202708141f4d555500230a676ed3fb3aa599390e0d40a604d8aebca53a161c5e0546e5581c8dee39af8144')

package() {
    install -Dm755 kaf-cli "$pkgdir/usr/bin/kaf-cli"
}
