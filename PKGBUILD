pkgname=rove-agent-bin
pkgver=0.1.1
pkgrel=5
pkgdesc="Rove Agent App"
arch=('x86_64')
url="https://github.com/artyompervykh/genius-ssh"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'cairo' 'pango' 'glib2' 'openssl' 'libayatana-appindicator' 'librsvg')
provides=('rove-agent')
conflicts=('rove-agent')

# Ссылка указывает точно на переименованный файл
source=("https://github.com/artyompervykh/genius-ssh/releases/download/${GITHUB_REF_NAME}/rove-agent_0.1.1-5_amd64.deb")
sha256sums=('SKIP')

prepare() {
    ar x "rove-agent_0.1.1-5_amd64.deb" data.tar.gz
}

package() {
    tar -xf data.tar.gz -C "$pkgdir"
}
