# Maintainer: zaraiskij <ruslan.zubaka@gmail.com>

pkgname=llmfs
pkgver=0.9.1
pkgrel=1
pkgdesc="Terminal-based AI service analyzer — scans responses for suspicious patterns and telemetry"
arch=('x86_64')
url="https://github.com/zaraiskij/llmfs"
license=('MIT')
depends=()
options=('!debug')
source=("llmfs-linux-x86_64::https://github.com/zaraiskij/llmfs/releases/download/v${pkgver}/llmfs-linux-x86_64")
sha256sums=('228d431946a5426621f22cb0cd462af6db8fc64ecd9d64df7f62efd949a16042')

package() {
    install -Dm755 "${srcdir}/llmfs-linux-x86_64" "${pkgdir}/usr/bin/llmfs"
}
