# Maintainer: George Woodall <georgewoodall82@gmail.com>
pkgname=tgpt-bin
pkgver=2.8.0
pkgrel=1
pkgdesc="ChatGPT in terminal without needing API keys"
arch=("x86_64" "aarch64" "i686")
url="https://github.com/aandrew-me/tgpt"
license=('GPL-3.0-only')
conflicts=('tgpt' 'tgpt-git')
depends=('glibc')
source_x86_64=("tgpt-linux-x86_64::https://github.com/aandrew-me/tgpt/releases/download/v${pkgver}/tgpt-linux-amd64")
source_aarch64=("tgpt-linux-aarch64::https://github.com/aandrew-me/tgpt/releases/download/v${pkgver}/tgpt-linux-arm64")
source_i686=("tgpt-linux-i686::https://github.com/aandrew-me/tgpt/releases/download/v${pkgver}/tgpt-linux-i386")
md5sums_x86_64=('d2cf4b0f676010df0def10527a137e45')
md5sums_aarch64=('5eaad2bf215bf992ed7bd50363ff9d5c')
md5sums_i686=('0ab51021c4cbc7ee13ba9ce7bffda785')

package() {
    cd "$srcdir"
    install -Dm755 tgpt-linux-$CARCH "$pkgdir/usr/bin/tgpt"
}
