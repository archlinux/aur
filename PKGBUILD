# Contributor: jim945 [at] mail . r [u]
pkgname=rootmp-hook
pkgver=1.8
pkgrel=2
pkgdesc="Initcpio hook for copyng root files or overlayfs in tmpfs or zram"
url="https://github.com/jim945"
arch=(any)
license=('GPL3')
install=${pkgname}.install
depends=('util-linux' 'rsync')
source=(${pkgname%-git}::git+http://github.com/jim945/rootmp-hook.git)

package() {
    install -o root -g root -D ${pkgname}/hooks/rootmp ${pkgdir}/usr/lib/initcpio/hooks/rootmp
    install -o root -g root -D ${pkgname}/install/rootmp ${pkgdir}/usr/lib/initcpio/install/rootmp
    }

md5sums=('SKIP')
