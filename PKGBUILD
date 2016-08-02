# Maintainer icasdri <icasdri at gmail dot com>

_pkgname=passthesalt
pkgname=passthesalt-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Dead simple asymmetric encryption tool for secure message exchange using libsodium."
arch=(any)
url="https://github.com/icasdri/passthesalt"
license=('GPLv3')
source=("https://github.com/icasdri/passthesalt/releases/download/${pkgver}/passthesalt-${pkgver}-linux.zip")
sha384sums=('7782f71287ec79a7a3f151ea6da5bc4c335d5d50c3fc45b0a4787e43d36899a5dfa540994fabe21d5942488dc6c122e2')

package() {
    cd "${srcdir}"
    install -Dm755 passthesalt "${pkgdir}/usr/bin/passthesalt"
}
