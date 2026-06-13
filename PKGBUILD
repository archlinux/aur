# Maintainer: fossisawesome <fossisawesome AT github DOT com>
pkgname=firmium-desktop-bin
pkgver=5.3.0
pkgrel=1
pkgdesc="Lightning fast OpenSubsonic player in Tauri"
arch=('x86_64')
url="https://github.com/fossisawesome/firmium"
license=('GPL-3.0-only')
depends=('webkit2gtk-4.1' 'alsa-lib' 'openssl')
provides=('firmium-desktop')
conflicts=('firmium-desktop-git')
options=('!strip')

source=("https://github.com/fossisawesome/firmium/releases/download/v${pkgver}/Firmium_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
  cd "$srcdir"
  bsdtar -xf "Firmium_${pkgver}_amd64.deb"
  bsdtar -xf "data.tar.gz" -C "$pkgdir"
}