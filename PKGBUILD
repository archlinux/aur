# Maintainer: George Katev <george_kate[at]hotmail[dot]com>

pkgname=geanywl
pkgver=1.1
pkgrel=1
pkgdesc="Geany editor launch script -- workspace separation, open in most recently focused window"
arch=('any')
url="https://gist.github.com/gkatev/f477f7f4bb0cfb2151cbfb7d6de0a511"
license=('GPL')
depends=('bash' 'util-linux' 'coreutils' 'procps-ng' 'iproute2' 'grep' 'sed')
optdepends=('wmctrl: X11 support'
            'xorg-xprop: X11 support'
            'kdotool>=0.3.0: KDE support (incl. Wayland)')
install=geanywl.install
source=('geanywl')
sha256sums=('076aac2025e23991e29747dd04c7444a7ef4278b13391710292788c9ec296cb6')

package() {
	install -D -m 755 "geanywl" -t "${pkgdir}/usr/bin/"
}
