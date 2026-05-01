# Maintainer: vmvarela <vmvarela@gmail.com>
pkgname=sql-pipe
pkgver=0.7.1
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
sha256sums_x86_64=('82ee1efabb52530182d5a4545b00ff8eaba806dc144f1456664ebebb8952fe1a')

source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/vmvarela/sql-pipe/releases/download/v${pkgver}/sql-pipe-aarch64-linux")
sha256sums_aarch64=('8702c78840c978b9e14f0123c7e850f90d20406f20e0d06e0b3eb4c5a2be7eba')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
