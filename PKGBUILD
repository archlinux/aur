# Maintainer: George Katev <george_kate[at]hotmail[dot]com>

pkgname=geanywl
pkgver=1.0
pkgrel=1
pkgdesc="Geany editor launch script -- workspace separation, open in most recently focused window"
arch=('any')
url="https://gist.github.com/gkatev/f477f7f4bb0cfb2151cbfb7d6de0a511"
license=('GPL')
depends=('bash' 'util-linux' 'coreutils' 'procps-ng' 'iproute2' 'grep' 'sed' 'wmctrl' 'xorg-xprop')
install=geanywl.install
source=('geanywl')
sha256sums=('f1b54fb1b02446f54150d8847fd5bf6ccb9363fbfac9e3b9ab2986a71a04e8f9')

package() {
	install -D -m 755 "geanywl" -t "${pkgdir}/usr/bin/"
}
