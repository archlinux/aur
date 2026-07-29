# Maintainer: xiSage

pkgname=hitokoto-cli-bin
pkgver=0.1.2
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


sha256sums_x86_64=('f87e4e85c8f9df179f59ccf7de092182f66a70248aefa0acd92ec8eb76db27dc')
sha256sums_aarch64=('74751f5c8d7a2d2349fb5221833bc8f8c0cf6644a23421ed481da7da4ae3d4cd')
sha256sums_armv7h=('df706ec6eb4fabc0a19d114daade0fd9dd8525c1fb2001763534ed6c554f2ce0')

package() {
    cd "$srcdir"
    install -Dm755 hitokoto "$pkgdir/usr/bin/hitokoto"
}
