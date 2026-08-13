# Maintainer: Caitlyn Williams <caitlyn dot williams at proton dot me>

pkgname=openscad-lsp-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="A LSP (Language Server Protocol) server for OpenSCAD."
arch=('x86_64' 'aarch64')
url="https://github.com/Leathong/openscad-LSP"
license=('Apache-2.0')
optdepends=('openscad: OpenSCAD compiler')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('strip' '!libtool' '!staticlibs' '!emptydirs')

source_x86_64=("openscad-lsp_x86_64_${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/openscad-lsp-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("openscad-lsp_aarch64_${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/openscad-lsp-aarch64-unknown-linux-gnu.tar.xz")

package() {
	install -dm755 "${pkgdir}/usr/bin/"
        cp -v ${srcdir}/openscad-lsp-*/openscad-lsp ${pkgdir}/usr/bin/
}

sha256sums_x86_64=('e51b7f84180d93a65387d3bbd00bb47ea1953af27d637c3698800f1b671005ea')
sha256sums_aarch64=('6e5f572bbbd193a5a1b7f538b4fea0ef5f082a9cafb3f8e978dd86905e3bfb9d')
