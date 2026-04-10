# Maintainer: alcxyz <me@alc.xyz>
pkgname=paperflow-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="File organizer and Paperless-ngx ingestion tool"
arch=('x86_64' 'aarch64')
url="https://github.com/alcxyz/paperflow"
license=('MIT')
depends=('libnotify')
provides=('paperflow')
conflicts=('paperflow')

source_x86_64=("${url}/releases/download/v${pkgver}/paperflow_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/paperflow_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('a09fb229d6ca1cb4888bd750e850006118f58ba216da8e10dafa463abef73c5b')
sha256sums_aarch64=('2cc54f48d95ea54f3e3579939b805db86618f1f32f335418e9329eee37e00365')

package() {
    install -Dm755 paperflow "${pkgdir}/usr/bin/paperflow"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
