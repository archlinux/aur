# Maintainer: Lauri Gustafsson <lauri at gustafla dot space>
pkgname=wgsl-analyzer-bin
pkgver=0.6.0
pkgrel=2
pkgdesc='A language server for the WGSL shading language'
url='https://github.com/wgsl-analyzer/wgsl-analyzer'
source_x86_64=("https://github.com/wgsl-analyzer/wgsl-analyzer/releases/download/v$pkgver/wgsl_analyzer-linux-x64")
noextract=('wgsl_analyzer-linux-x64')
arch=('x86_64')
license=('MIT' 'APACHE')
depends=('gcc-libs')
conflicts=('wgsl-analyzer')
provides=('wgsl-analyzer')
sha256sums_x86_64=('3d05d3ad9ad0da495b966c27f66cd83b22f0e4f43b8b5f7e169e182c3e6db866')

package() {
  install -Dm755 "${srcdir}/wgsl_analyzer-linux-x64" "${pkgdir}/usr/bin/wgsl_analyzer"
}
