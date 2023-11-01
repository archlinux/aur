# Maintainer: Lauri Gustafsson <lauri at gustafla dot space>
pkgname=wgsl-analyzer-bin
pkgver=0.8.0
pkgrel=1
pkgdesc='A language server for the WGSL shading language'
url='https://github.com/wgsl-analyzer/wgsl-analyzer'
source_x86_64=("https://github.com/wgsl-analyzer/wgsl-analyzer/releases/download/v$pkgver/wgsl_analyzer-linux-x64")
arch=('x86_64')
license=('MIT' 'APACHE')
depends=('gcc-libs')
conflicts=('wgsl-analyzer')
provides=('wgsl-analyzer')
sha256sums_x86_64=('4a4e3cbc029a5003029a3bb47410b860fc4a229df93caf3b1affb812c58373e7')

package() {
  install -Dm755 "${srcdir}/wgsl_analyzer-linux-x64" "${pkgdir}/usr/bin/wgsl_analyzer"
}
