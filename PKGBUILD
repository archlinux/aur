# Maintainer: Adam S Levy <adam@aslevy.com>
pkgname=xrasengan
pkgver=1.0.0
pkgrel=5
pkgdesc="An xrandr wrapper to make your multi-monitor setup easier"
arch=("any")
url="https://github.com/geyslan/xrasengan"
license=('Apache')
makedepends=('git')
depends=('xorg-xrandr' 'arandr')
optdepends=('bash-completion')
options=('!strip')
source=("git+https://github.com/geyslan/xrasengan.git")
md5sums=('SKIP')

package() {
	cd "$pkgname"
        install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
        install -Dm644 ${pkgname}_complete \
          "$pkgdir/usr/share/bash-completion/${pkgname}_complete"
}
