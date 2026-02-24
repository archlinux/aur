# Maintainer: Lars Corneliussen <lars@corneliussen.de>
pkgname=md365-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="AI-native CLI for Microsoft 365 - calendars, contacts, and mail as Markdown"
arch=('x86_64' 'aarch64')
url="https://github.com/lcorneliussen/md365"
license=('MIT')
provides=('md365')
conflicts=('md365')

source_x86_64=("${url}/releases/download/v${pkgver}/md365_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/md365_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('77d6950f6e736acae24901300c405d105f94232fa6fa5ab2b66d60d7f1ec814d')
sha256sums_aarch64=('26af2bc18b269779f285802f2ffabd79a470a94466aac7444f942f85be4f69b1')

package() {
    install -Dm755 md365 "${pkgdir}/usr/bin/md365"
}
