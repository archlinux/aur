pkgname=pacman-log-orphans-hook
pkgver=1.0
pkgrel=1
pkgdesc='hook to check whether there are any packages marked as unrequired (orphans) via pacman -Qttdq after every pacman run'
arch=(any)
depends=()
source=(log-orphans.hook)
sha256sums=('49ddc67ad6dbb1e57a13ca0c3c2f0de243fad98b302d4f708b3a746522b56ebb')

package() {
    install -Dm0644 -t "$pkgdir/usr/share/libalpm/hooks/" ${source[0]}
}