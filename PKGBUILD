# Maintainer: xz-dev <xiangzhedev at gmail dot com>
pkgname=clash-meta-cap-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Clash.Meta with Capabilities for Transparent Proxies"
arch=(x86_64)
url="https://github.com/MetaCubeX/Clash.Meta"
license=(MIT)
depends=(clash-meta libcap)
provides=(clash-meta-cap)
source=(clash-meta-cap.hook clash-meta-cap.sh)
sha512sums=('49b08f813069ee0467acb4eeeb895e7a80411337b7bf52c9bd35dc3a2934be5529c549eb014a066ffd061708df1d83a28be93637ded659cc70c0cc07d196b436'
            '2a2249acfe52d334997e6fe5afe5a3df0e74e6bb3ae1d2c1c04a54ff19b4ae5f691cd3c9db696ba56ffd407fe562f156693a3dd7a4b942cdeaae88e2ced8212b')
install='clash-meta-cap.sh'

package() {
    install -Dm644 "$srcdir"/clash-meta-cap.hook -t "$pkgdir"/usr/share/libalpm/hooks/
}
