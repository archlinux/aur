# Maintainer: xiSage

pkgname=hitokoto-cli-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Command-line tool to fetch hitokoto (yiyan) from hitokoto.cn"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/xiSage/hitokoto-cli"
license=('MIT')
provides=("hitokoto-cli=${pkgver}")
conflicts=("hitokoto-cli")
options=(!strip)

source_x86_64=("hitokoto-${pkgver}-linux-x64.tar.gz::https://github.com/xiSage/hitokoto-cli/releases/download/v${pkgver}/hitokoto-linux-x64.tar.gz")
source_aarch64=("hitokoto-${pkgver}-linux-arm64.tar.gz::https://github.com/xiSage/hitokoto-cli/releases/download/v${pkgver}/hitokoto-linux-arm64.tar.gz")
source_armv7h=("hitokoto-${pkgver}-linux-arm.tar.gz::https://github.com/xiSage/hitokoto-cli/releases/download/v${pkgver}/hitokoto-linux-arm.tar.gz")


sha256sums_x86_64=('8953f4cbb627bd904ce0fe0bedf7a41b51a1cc5f1760b0eac6848719af9fa6b2')
sha256sums_aarch64=('f5ddcdcba268787d12cded2b88cd50dfda84f23a7152aa53d691b331a232bf8e')
sha256sums_armv7h=('7132f295593d85c8016efca7fc2969f7be2da018efbd6bb9bc28765a2c553da9')

package() {
    cd "$srcdir"
    install -Dm755 hitokoto "$pkgdir/usr/bin/hitokoto"
}
