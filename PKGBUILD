# Maintainer: Lauri Gustafsson <lauri at gustafla dot space>
pkgname=wgsl-analyzer-bin
pkgver=0.5.3
pkgrel=1
pkgdesc='A language server for the WGSL shading language'
url='https://github.com/wgsl-analyzer/wgsl-analyzer'
source_x86_64=("https://github.com/wgsl-analyzer/wgsl-analyzer/releases/download/v$pkgver/wgsl_analyzer-linux-x64")
arch=('x86_64')
license=('MIT' 'APACHE')
depends=('gcc-libs')
conflicts=('wgsl-analyzer')
provides=('wgsl-analyzer')
sha256sums_x86_64=('1b2b65368ca9a7f80ced2983a92947bd1e477c60f139f40256fd76febf5abff4')

package() {
  install -Dm755 "${srcdir}/wgsl_analyzer-linux-x64" "${pkgdir}/usr/bin/wgsl_analyzer"
}
