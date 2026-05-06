# Maintainer: 404mon <daemn404@gmail.com>
pkgname=netchi-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Autonomous AI-driven network reconnaissance cyberdeck (Pre-compiled)"
arch=('x86_64')
url="https://github.com/404mon/netchi"
license=('GPL3')
depends=('nmap' 'libpcap' 'webkit2gtk-4.1' 'gtk3')
provides=('netchi')
conflicts=('netchi')


source=("https://github.com/404mon/netchi/releases/download/v${pkgver}/netchi_${pkgver}_amd64.deb")
sha256sums=('5dfa4a22469c805f7eef6a0a32006db99936cb84a96f8400b1a1179f6e73b4f0')

install='netchi.install'

package() {
    cd "$srcdir"
    tar -xf data.tar.* -C "$pkgdir/"
}
