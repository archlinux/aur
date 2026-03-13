pkgname=codeql-cli-bin
pkgver=2.24.3
pkgrel=1
pkgdesc="The GitHub CodeQL CLI (Command Line Interface)"
arch=('x86_64')
url="https://github.com/github/codeql-cli-binaries"
license=('custom')
source=("https://github.com/github/codeql-cli-binaries/releases/download/v${pkgver}/codeql-linux64.zip")
sha256sums=('d6df2de5da773d5f67864d0850126572028ebdf76591a8e0d5131c216738c613')
package() {
    mkdir -p "${pkgdir}/opt/codeql"
    cp -r "${srcdir}/codeql/"* "${pkgdir}/opt/codeql/"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/codeql/codeql" "${pkgdir}/usr/bin/codeql"
}
