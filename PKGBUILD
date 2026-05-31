pkgname=scrop-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Precise Wayland region selector with resize and confirm controls'
arch=('x86_64')
url='https://github.com/ferdinankurnian/scrop'
license=('MIT')
depends=('cairo' 'gcc-libs' 'glib2' 'glibc' 'pango')
provides=('scrop')
conflicts=('scrop')
source=("scrop-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/scrop-${pkgver}-x86_64.tar.gz")
sha256sums=('b56affb96d2fd41a572a4546290fc0bbac1cfcc4c6a5a43280adfeaf98e10376')

package() {
  install -Dm755 scrop "${pkgdir}/usr/bin/scrop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
