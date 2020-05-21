# Maintainer: DuckSoft <realducksoft at gmail dot com>
pkgname=v2ray-cap-git
pkgver=0.0.1
pkgrel=1
pkgdesc="V2Ray Core with Capabilities for Transparent Proxies"
arch=(x86_64)
url="https://github.com/v2ray/v2ray-core"
license=(MIT)
depends=(v2ray libcap)
provides=(v2ray-cap)
source=(v2ray-cap.hook v2ray-cap.sh)
sha512sums=('90d16c05802b7b45742131fcb38fde26a343462a11452e0dbcfa9ef6dc39c27cff355bd8fadb654255dd9f09126835e26681940a3f9fb245b583dad4d06ca1ac'
            '75238188db3d49b36a9d3003d997af30c6a82edcaa5fc0a6657e2c5338d62d58bbed1fdf3c34ba361086032da8b3c2623842ae461cf2c3cbd8db12792c94d1a8')
install='v2ray-cap.sh'

package() {
    install -Dm644 "$srcdir"/v2ray-cap.hook -t "$pkgdir"/usr/share/libalpm/hooks/
}
