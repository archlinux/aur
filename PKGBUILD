# Maintainer: Amos (LFlare) Ng <me@amosng.com>

pkgname=paping-bin
pkgver=1.5.5
pkgrel=1
pkgdesc="Cross-platform TCP port testing, emulating the functionality of ping (port ping)"
arch=('x86_64')
url="https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/paping"
license=('MIT')
source=(${pkgname}-${pkgver}.tar.gz::${url}/${pkgname%-bin}_${pkgver}_x86-64_linux.tar.gz)
b2sums=('2857200a5b3593add689dd060d3ca7e707158c9e7680fd3081d7f19ef3734e1789faf254f8e22b599089781a1f94e3b2ddfb21adf30e989d0e5eb2dcbfd70418')

package() {
    cd "$srcdir/"
    install -Dm755 "./${pkgname%-bin}" -t "${pkgdir}/usr/bin"
}
