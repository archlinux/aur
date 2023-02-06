# Maintainer: Eric Bower <aur@erock.io>
pkgname="sentences-bin"
pkgver="1.0.0"
pkgrel="2"
pkgdesc="A multilingual command line sentence tokenizer"
arch=("x86_64")
license=("mit")
source=(
    "https://github.com/neurosnap/sentences/releases/download/v1.1.2/sentences_linux-amd64.tar.gz"
)
sha512sums=(
    "7f5e4aad8d3655c003e25f2ce36cca9004de895743853ed619793b8a2467bbe3b1e169cba5d3173024ff4b49dac7ca7cf8162be799dc0feade02c8d0961574bf"
)
package() {
    tar -xvf "${srcdir}/sentences_linux-amd64.tar.gz"
    mkdir -p "${pkgdir}/usr/bin"
    cp "${srcdir}/sentences" "${pkgdir}/usr/bin/sentences"
    chmod +x "${pkgdir}/usr/bin/sentences"
}
