pkgname=scrop-bin
pkgver=0.1.3
pkgrel=1
pkgdesc='Precise Wayland region selector with resize and confirm controls'
arch=('x86_64')
url='https://github.com/ferdinankurnian/scrop'
license=('MIT')
depends=('cairo' 'gcc-libs' 'glib2' 'glibc' 'pango')
provides=('scrop')
conflicts=('scrop')
source=("scrop-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/scrop-${pkgver}-x86_64.tar.gz")
sha256sums=('232f31faf3416c56b07b1e1497aa6d3064bf74728789d2ac52d45468e176d281')

package() {
  install -Dm755 scrop "${pkgdir}/usr/bin/scrop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
