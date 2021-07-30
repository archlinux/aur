# Maintainer: PQCraft <0456523@gmail.com>

pkgname=clibasic-bin
pkgver=0.17.1
pkgrel=1
pkgdesc="A BASIC interpreter for the terminal written in C"
arch=(x86_64 i686)
url="https://github.com/PQCraft/clibasic"
license=(GPL3)
depends=('glibc' 'readline')
provides=(clibasic)
conflicts=(clibasic)
source_x86_64=("${pkgname}-${pkgver}-${pkgrel}-x64.zip::https://github.com/PQCraft/clibasic/releases/download/${pkgver}/clibasic-linux-x64.zip")
source_i686=("${pkgname}-${pkgver}-${pkgrel}-x86.zip::https://github.com/PQCraft/clibasic/releases/download/${pkgver}/clibasic-linux-x86.zip")
sha256sums_x86_64=('SKIP')
sha256sums_i686=('SKIP')

package() {
    cd "${srcdir}"
    install -Dm755 clibasic -t "${pkgdir}/usr/bin/"
}

