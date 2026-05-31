pkgname=rove-agent-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Rove Agent App"
arch=('x86_64')
url="https://github.com/artyompervykh/genius-ssh"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'cairo' 'pango' 'glib2' 'openssl' 'libayatana-appindicator' 'librsvg')
provides=('rove-agent')
conflicts=('rove-agent')
source=("https://github.com/artyompervykh/genius-ssh/releases/download/v${pkgver}/rove-agent_${pkgver}_amd64.deb")
sha256sums=('SKIP')

prepare() {
    ar x "rove-agent_${pkgver}_amd64.deb" data.tar.gz
}

package() {
    tar -xf data.tar.gz -C "$pkgdir"
}
