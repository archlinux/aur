# Maintainer: Longbridge <developer@longbridge.com>
# Contributor: Hogan Yuan <zhanghong.yuan@longbridge-inc.com>

pkgname=longbridge-terminal
pkgver=0.22.1
pkgrel=1
pkgdesc="AI-native CLI for Longbridge Securities — real-time market data, portfolio, and trading"
arch=('x86_64' 'aarch64')
url="https://github.com/longbridge/longbridge-terminal"
license=('custom:proprietary')
provides=('longbridge')
conflicts=('longbridge')
options=('!strip')

source_x86_64=("${pkgname}-${pkgver}-linux-amd64.tar.gz::https://github.com/longbridge/longbridge-terminal/releases/download/v${pkgver}/longbridge-terminal-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-linux-arm64.tar.gz::https://github.com/longbridge/longbridge-terminal/releases/download/v${pkgver}/longbridge-terminal-linux-arm64.tar.gz")

sha256sums_x86_64=('8e62bad91fe002da52b476290d1abb653beb8da1bb4d87a82b272e9f4e8d1dd8')
sha256sums_aarch64=('41dc3ba8bdd395cd6022f6dfe862e34b02da4fd5b7c24c74a5afb11d8271bc18')

package() {
    install -Dm755 "${srcdir}/longbridge" "${pkgdir}/usr/bin/longbridge"
}
