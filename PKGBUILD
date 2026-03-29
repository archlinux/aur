# Maintainer: Creptic <creptics@gmail.com>
pkgname=qbtctl-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="Minimal CLI for qBittorrent (prebuilt static binary)"
arch=('x86_64')
url="https://github.com/creptic/qbtctl"
license=('MIT')
depends=()
sha256sums=('12fb2a51db92f4afb359b9ce030c52b79da08b47b5b8d329c6226fe5f473139b')
options=('!debug')
conflicts=('qbtctl' 'qbtctl-git')
provides=('qbtctl')

# Download the binary; use ::filename to ensure proper name
source=("https://github.com/creptic/qbtctl/releases/download/${pkgver}/qbtctl")
noextract=("qbtctl")

package() {
    install -Dm755 "$srcdir/qbtctl" "$pkgdir/usr/bin/qbtctl"
}
sha256sums=('7ca9790df1b1f146069b1740f0e1dcb3a312ce7d723ee8b06904b5caef21c318')
