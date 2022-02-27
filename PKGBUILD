# Maintainer: Ayatale <ayatale@qq.com>

pkgname=alist-bin
_pkgname=${pkgname%-bin}
pkgver=2.1.0
_pkgver=${pkgver}
pkgrel=3
pkgdesc="Another file list program that supports multiple storage"
arch=("aarch64" "arm" "armv6h" "armv7h"  "i686" "x86_64")
url="https://github.com/Xhofe/alist"
license=('AGPL3')
provides=(${_pkgname})
source=("alist.service")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz"::"${url}/releases/download/v${_pkgver}/alist-linux-arm64.tar.gz")
source_arm=("$_pkgname-$pkgver-arm.tar.gz"::"${url}/releases/download/v${_pkgver}/alist-linux-arm-5.tar.gz")
source_armv6h=("$_pkgname-$pkgver-armv6h.tar.gz"::"${url}/releases/download/v${_pkgver}/alist-linux-arm-6.tar.gz")
source_armv7h=("$_pkgname-$pkgver-armv7h.tar.gz"::"${url}/releases/download/v${_pkgver}/alist-linux-arm-7.tar.gz")
source_i686=("$_pkgname-$pkgver-i686.tar.gz"::"${url}/releases/download/v${_pkgver}/alist-linux-386.tar.gz")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz"::"${url}/releases/download/v${_pkgver}/alist-linux-amd64.tar.gz")
sha256sums=('4fe3bea4a6a0fd67e89dfaf7dd273754f9b93e22f70d5aae41789e2cf20b1cc6')
sha256sums_aarch64=('2421692ba382902212e801db1e2b1bcc073ba03bd0db50995469f8c67317c9c2')
sha256sums_arm=('ad76cc4f53fe0babc1f9a3a5fc43d7538744796234b41479a9b95225576cb429')
sha256sums_armv6h=('9f47b7e83cf4af21e1a24b27c7703460351e062541d71fd78a57f5b305162fdd')
sha256sums_armv7h=('67e927bdae8fa703928b2350c12c125f29d4c4eb9278f3d99650d397543a714e')
sha256sums_i686=('9d543f2f57019b4476823c7ca38dfcd27cd1b25ad07b89fe5267158c4bc3e2ac')
sha256sums_x86_64=('c52d35bd04ae6a99763979f290e2124e448809701530a53450d2e48f3e98d21b')

package() {
    install -Dm755 alist-linux* ${pkgdir}/usr/bin/alist
    install -Dm644 alist.service -t ${pkgdir}/usr/lib/systemd/system/
}
