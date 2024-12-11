# Maintainer: Sematre <sematre at gmx dot de>
pkgname=flawless
_pkgver=1.0.0-beta.3
pkgver=${_pkgver//-/.}
pkgrel=1

pkgdesc="Durable execution engine for Rust."
arch=('x86_64' 'aarch64')
url="https://flawless.dev"
license=('custom')

source_x86_64=("${pkgname}-${pkgver}-x86_64::https://downloads.flawless.dev/${_pkgver}/x64-linux/flawless")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://downloads.flawless.dev/${_pkgver}/aarch64-linux/flawless")
sha256sums_x86_64=('b511598babcde8a8bc7898f6e0c7b06b3f51a2d26227fba1cc480b06af5a215c')
sha256sums_aarch64=('555a367208beba65493e18fe83270f121105a63e830960e1f649543e7a8b4936')

package() {
	install -Dm 755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname}"
}
