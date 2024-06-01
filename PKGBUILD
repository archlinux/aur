# Maintainer: George Woodall <georgewoodall82@gmail.com>
pkgname=tgpt-bin
pkgver=2.7.4
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
md5sums_x86_64=('52f7da7f14fae945e3376278269c11db')
md5sums_aarch64=('84454953db4f52c8f6dd2d5accfc0673')
md5sums_i686=('278deef6e9f683defb70a0bb395b291e')

package() {
    cd "$srcdir"
    install -Dm755 tgpt-linux-$CARCH "$pkgdir/usr/bin/tgpt"
}
