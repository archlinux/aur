pkgname=pacman-log-orphans
pkgver=1
pkgrel=1
arch=(any)
depends=(bash)
source=(log-orphans.hook log-orphans.sh)
sha256sums=('ea8022f998bb6dd09fbbb74632672c9e27edcf9248c8679ef1f378d3a843ed89'
            'd1645fff92ee4c1c68403972f06d6b1f6320b2a60f77a83dcd1290906be24b9d')

package() {
    install -Dm644 log-orphans.hook "$pkgdir/usr/share/libalpm/hooks/log-orphans.hook"
    install -Dm755 log-orphans.sh "$pkgdir/usr/bin/log-orphans"
}
