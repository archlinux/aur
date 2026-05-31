pkgname=scrop-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='Precise Wayland region selector with resize and confirm controls'
arch=('x86_64')
url='https://github.com/ferdinankurnian/scrop'
license=('MIT')
depends=('cairo' 'gcc-libs' 'glib2' 'glibc' 'pango')
provides=('scrop')
conflicts=('scrop')
source=("scrop-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/scrop-${pkgver}-x86_64.tar.gz")
sha256sums=('a9a322b039ef388cbfaaea1e2573ac7af0ed421e9dd9795e6b409c6d64b79dcb')

package() {
  install -Dm755 scrop "${pkgdir}/usr/bin/scrop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
