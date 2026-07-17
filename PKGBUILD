# Maintainer: vmvarela <vmvarela@gmail.com>
pkgname=sql-pipe
pkgver=0.18.1
pkgrel=1
pkgdesc="Read CSV via stdin, run SQL, emit CSV via stdout"
arch=('x86_64' 'aarch64')
url="https://github.com/vmvarela/sql-pipe"
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")

source=("LICENSE::https://raw.githubusercontent.com/vmvarela/sql-pipe/v${pkgver}/LICENSE")
sha256sums=('3f3d9e0024b1921b067d6f7f88deb4a60cbe7a78e76c64e3f1d7fc3b779b9d04')

source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/vmvarela/sql-pipe/releases/download/v${pkgver}/sql-pipe-x86_64-linux")
sha256sums_x86_64=('f3685be6f46e9fcf6913489a5e12f9395ef10a63b8d8a310651a980342410ab9')

source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/vmvarela/sql-pipe/releases/download/v${pkgver}/sql-pipe-aarch64-linux")
sha256sums_aarch64=('e3594e292e343bac7010b20c8928dc90b125e537566c7afccd451f16247bb8fe')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
