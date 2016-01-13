# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
# Credits: Based on https://gist.github.com/monkbroc/b283bb4da8c10228a61e
pkgname=particle-udev
pkgver=0.1
pkgrel=1
pkgdesc="udev rules for Particle Photon / Electron / Core."
arch=('any')
url="https://gist.github.com/monkbroc/b283bb4da8c10228a61e"
license=('MIT')
source=('99-particle.rules')
sha256sums=('c76bb8f49325976a0c4116325384efe09f9bf61bc7cac011b32ee850c424e2ea')

package() {
    rulesdir="$pkgdir/etc/udev/rules.d/"
    mkdir -p $rulesdir
    cp "99-particle.rules" $rulesdir
}
