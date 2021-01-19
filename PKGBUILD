# Maintainer: Fabian Bornschein <plusfabi-cat-gmail-dog-com>
pkgname=preconf-sudo-wheel
pkgver=1
pkgrel=1
pkgdesc="configures sudo to allow members of group wheel"
url='https://wiki.archlinux.org/index.php/Sudo'
arch=('any')
license=('MIT')
depends=('sudo')
install="archlinux.install"
source=("71-wheel")
sha512sums=('158d16583bf2a28d6a2d12ed0b5e87e02b9fc46f5b032650251e377203637cd9baad27274e89e6d886d3f0b32261efd392bcd1c64b2e7559cc6824f944817857')

package() {
    install -dm 750 "${pkgdir}/etc/sudoers.d"
    install -Dm 440 "${srcdir}/71-wheel" \
    	"${pkgdir}/etc/sudoers.d/71-wheel"
}
