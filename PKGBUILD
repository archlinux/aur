# Maintainer: galak9 <alterk@qq.com>
pkgname=qoder-cli-cn-bin
pkgver=1.0.11
pkgrel=1
pkgdesc="Qoder CLI (CN version)  An agentic AI coding tool built for command-line developers."
arch=('x86_64' 'aarch64')
url="https://qoder.com.cn"
license=('custom')
provides=('qoder-cli-cn')
conflicts=('qoder-cli-cn')
options=('!strip' '!debug')
source_x86_64=("https://static.qoder.com.cn/qoder-cli-cn/releases/${pkgver}/qoderclicn-linux-x64.tar.gz")
source_aarch64=("https://static.qoder.com.cn/qoder-cli-cn/releases/${pkgver}/qoderclicn-linux-arm64.tar.gz")
sha256sums_x86_64=('7e0aa4c217b5555d92af874c7f3a2018bae45d130ea51e6b839dfc25bc644f5c')
sha256sums_aarch64=('f391bf3fffb23cb6b3251981ba02c5019c83994df65b13b073052dc8e6a9f242')

package() {
    install -Dm755 "${srcdir}/qoderclicn" "${pkgdir}/usr/bin/qoderclicn"
}
