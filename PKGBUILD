pkgname=scrop-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='Precise Wayland region selector with resize and confirm controls'
arch=('x86_64')
url='https://github.com/ferdinankurnian/scrop'
license=('MIT')
depends=('cairo' 'gcc-libs' 'glib2' 'glibc' 'pango')
provides=('scrop')
conflicts=('scrop')
source=("scrop-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/scrop-${pkgver}-x86_64.tar.gz")
sha256sums=('5b24fd4ceafc0137399d90da636192395561ae95a0a7e63a2f23d3cc797bd829')

package() {
  install -Dm755 scrop "${pkgdir}/usr/bin/scrop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
