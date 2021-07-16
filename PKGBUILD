# Maintainer: PQCraft <0456523@gmail.com>

pkgname=clibasic-bin
pkgver=0.16
pkgrel=2
pkgdesc="A BASIC interpreter for the terminal written in C"
arch=(x86_64 i686)
url="https://github.com/PQCraft/clibasic"
license=(GPL3)
depends=('glibc' 'readline')
provides=(clibasic)
conflicts=(clibasic)
source_x86_64=("${pkgname}-${pkgver}-x64.zip::https://github.com/PQCraft/clibasic/releases/download/${pkgver}/clibasic-linux-x64.zip")
source_i686=("${pkgname}-${pkgver}-x86.zip::https://github.com/PQCraft/clibasic/releases/download/${pkgver}/clibasic-linux-x86.zip")
sha256sums_x86_64=('2fd6a0e1a6ce89bab4f2d314343c0ccd6165ccb867cca2ebbd574199a1e79e0a')
sha256sums_i686=('c46ccb7df4d614087119fea6266483e044b9165bd21fef2b6dc909382064c568')

package() {
    cd "${srcdir}"
    install -Dm755 clibasic -t "${pkgdir}/usr/bin/"
}

