# Maintainer: xotkot
pkgname=refold-bin
pkgver=0.1.2
pkgrel=3
pkgdesc="A command-line utility for wrapping text"
arch=('x86_64' 'aarch64')
url="https://github.com/wr7/refold"
license=('GPL-2.0-or-later')
source_x86_64=("${pkgname/-bin/}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${pkgname/-bin/}-x86_64")
source_aarch64=("${pkgname/-bin/}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/${pkgname/-bin/}-arm64")
b2sums_x86_64=('5928be31b87bf441b3c573cbdbf67f15e536f55c5f50c56f769f0a424c32c688da0c285b3e33c49ea3083c649584c420173a5495c4e779b86f265e505624b6c5')
b2sums_aarch64=('5c52973aa065e68b01c5369ea264e73ac647a733e36a3396d153d4204bde6d4f7a7c30e0032b4634bb5bed0ce8580bbda5a0a11c6258beae9fd27256593b8e4e')
provides=('refold')
conflicts=('refold')

package() {
	install -Dm755 "${pkgname/-bin/}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
