# Maintainer: DNS Robot <hello@dnsrobot.net>
pkgname=dns-robot-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="DNS lookups, WHOIS, SSL checks, and 50+ network tools — powered by dnsrobot.net"
arch=('any')
url="https://dnsrobot.net"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/dns-robot-cli/-/dns-robot-cli-${pkgver}.tgz")
sha256sums=('SKIP')

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/package"
    install -Dm644 "${srcdir}/package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
