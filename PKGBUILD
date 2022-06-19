# Maintainer: Eric Bower <aur@erock.io>
pkgname="sentences-bin"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="A multilingual command line sentence tokenizer"
arch=("x86_64")
license=("mit")
source=(
    "https://github.com/neurosnap/sentences/releases/download/v1.0.12/sentences_linux-amd64.tar.gz"
)
sha512sums=(
    "9479900ba881717e280ba6de25b231c93995e1e79666a4ff1be050513d2d3e64d2b4f8902fdcf90cd067bafe9e6718ad761927fe5a0e3ca238ac7c606be7120b"
)
package() {
    tar -xvf "${srcdir}/sentences_linux-amd64.tar.gz"
    mkdir -p "${pkgdir}/usr/bin"
    cp "${srcdir}/sentences" "${pkgdir}/usr/bin/sentences"
    chmod +x "${pkgdir}/usr/bin/sentences"
}
