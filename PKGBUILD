_pkgname=texlab
pkgname=${_pkgname}-bin
pkgver=5.24.0
pkgrel=1
arch=('aarch64' 'armv7h' 'x86_64')
pkgdesc='A cross-platform implementation of the Language Server Protocol for LaTeX'
provides=('texlab')
conflicts=('texlab' 'texlab-git')
depends=('gcc-libs')
url='https://github.com/latex-lsp/texlab'
license=('GPL-3.0')
source=("https://raw.githubusercontent.com/latex-lsp/texlab/v${pkgver}/LICENSE")
source_aarch64=("https://github.com/latex-lsp/texlab/releases/download/v${pkgver}/texlab-${CARCH}-linux.tar.gz")
source_armv7h=("${source_aarch64[@]}")
source_x86_64=("${source_aarch64[@]}")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_aarch64=('3756a02aedf5ad4636091b3608059ff732a20b34d73696f0ef03323ce08e9746')
sha256sums_armv7h=('3756a02aedf5ad4636091b3608059ff732a20b34d73696f0ef03323ce08e9746')
sha256sums_x86_64=('3756a02aedf5ad4636091b3608059ff732a20b34d73696f0ef03323ce08e9746')

package() {
  install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
