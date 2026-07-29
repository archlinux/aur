# Maintainer: xiSage

pkgname=hitokoto-cli-bin
pkgver=0.1.1
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


sha256sums_x86_64=('85708233011954ee6e941db6c87964a5647c544e62f814505aaabf78d8e86f79')
sha256sums_aarch64=('21eb960f99f0c2882d29acd76cd4bb8ed7f88a186d8b6e3735ea394124c3ef44')
sha256sums_armv7h=('b8105bf3b7e8880956d737bc3bff2290c5089ba941fb1873e542fedc7f4820bc')

package() {
    cd "$srcdir"
    install -Dm755 hitokoto "$pkgdir/usr/bin/hitokoto"
}
