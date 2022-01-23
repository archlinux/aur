# Maintainer: pu <pu.mb@qq.com>
pkgname=ltex-ls-bin
_pkgname=ltex-ls
pkgver=15.2.0
pkgrel=1
pkgdesc="LTeX Language Server: LSP language server for LanguageTool magheavy_check_mark with support for LaTeX mortar_board, Markdown memo, and others"
arch=('x86_64')
usl="https://github.com/valentjn/ltex-ls"
license=('MPL2')
provides=('ltex-ls')
source=("https://github.com/valentjn/ltex-ls/releases/download/15.2.0/ltex-ls-15.2.0-linux-x64.tar.gz")
md5sums=('6234713566e863420c728e32273ed88c')

package() {
    install -d "${pkgdir}/opt/${_pkgname}"
    install -d "${pkgdir}/usr/bin"

    cp -r "${srcdir}/${_pkgname}-${pkgver}/"* "${pkgdir}/opt/${_pkgname}/"

    ln -sf /opt/${_pkgname}/bin/ltex-ls "${pkgdir}"/usr/bin/ltex-ls
    ln -sf /opt/${_pkgname}/bin/ltex-cli "${pkgdir}"/usr/bin/ltex-cli
}
