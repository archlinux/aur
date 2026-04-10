pkgname=truckers-tool-linux-bin
pkgver=1.1.6
pkgrel=1
pkgdesc="A web-based save editor for ETS2 and ATS on Linux (Desktop App)"
arch=('x86_64')
url="https://github.com/efzynx/truckers-tool-linux"
license=('GPL3')
provides=('truckers-tool-linux')
conflicts=('truckers-tool-linux')
depends=('nss' 'libxss' 'gtk3')
options=('!strip')
source=("https://github.com/efzynx/truckers-tool-linux/releases/download/v${pkgver}/truckers-tool-linux-${pkgver}.deb")
sha256sums=('SKIP')

package() {
  # makepkg akan otomatis mengekstrak file .deb
  # Hasil ekstraksi akan berupa file data.tar.xz dan control.tar.xz
  # Kita hanya butuh data.tar.xz untuk disalin ke folder instalasi pkgdir
  tar -xf data.tar.xz -C "${pkgdir}"
}
