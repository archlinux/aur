pkgname=texlab-bin
_pkgname=texlab
pkgver=5.11.0
pkgrel=1
arch=('x86_64')
pkgdesc='A cross-platform implementation of the Language Server Protocol for LaTeX'
provides=(texlab)
conflicts=(texlab texlab-git)
depends=('gcc-libs')
url='https://github.com/latex-lsp/texlab'
license=('GPL-3.0')
source=("https://github.com/latex-lsp/texlab/releases/download/v$pkgver/texlab-x86_64-linux.tar.gz"
		"local://LICENSE")
sha256sums=('b769f6895bb2f958d070bbdfbc7f724d159e353cf9a327de1ec5a799834305d5'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
  install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

