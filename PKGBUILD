# Maintainer: DuckSoft <realducksoft at gmail dot com>
pkgname=v2ray-cap-git
pkgver=1.0.0
pkgrel=1
pkgdesc="V2Ray Core with Capabilities for Transparent Proxies"
arch=(x86_64)
url="https://github.com/v2ray/v2ray-core"
license=(MIT)
depends=(v2ray libcap)
provides=(v2ray-cap)
source=(v2ray-cap.hook v2ray-cap.sh)
sha512sums=('31ebfe2bbccf6bcc9804446090cf0ef08ea4c8b7143eddfeb550d88b1551831353ac0cfbf8c07a146b1ee74250a249a64a9e62a526271fdb8eb50197c195c515'
            '050cde19902d2376af850d7f8482c25f4130597f19d82ddfaf372e16eba93f274db40b3ed85cd2a5e628a5a99a39c2c28963df3b683bff52c3a4620084fd2517')
install='v2ray-cap.sh'

package() {
    install -Dm644 "$srcdir"/v2ray-cap.hook -t "$pkgdir"/usr/share/libalpm/hooks/
}
