# Maintainer: Monika Crichton <monika+aur@mcrichton.net>

pkgname=mallet-tunnel-bin
pkgver=0.0.5
pkgrel=1
pkgdesc="TCP tunnel that works like VPN"
arch=('i386' 'x86_64' 'aarch64')
url="https://github.com/ryotarai/mallet"
license=('unknown')
provides=('mallet-tunnel')
conflicts=('mallet-tunnel')
source_x86_64=("https://github.com/ryotarai/mallet/releases/download/v${pkgver}/mallet_${pkgver}_linux_amd64.tar.gz")
source_i386=("https://github.com/ryotarai/mallet/releases/download/v${pkgver}/mallet_${pkgver}_linux_386.tar.gz")
source_aarch64=("https://github.com/ryotarai/mallet/releases/download/v${pkgver}/mallet_${pkgver}_linux_arm64.tar.gz")

sha256sums_i386=('f3997c7b894f2f3ebfa1023f8134813fc5e0dc1a96a52e74d8bd37c91508fd7b')
sha256sums_x86_64=('32a429d6fb3a3d8837cc61851bc90544dab8c79eb6ef3df5616dbf57b9aa5314')
sha256sums_aarch64=('c65bd49fcd04311cd5c95f520315930e278e8ef1691c1509fe7b111d8ef9212f')

package() {
  install -D -m755 "mallet" "${pkgdir}/usr/bin/mallet"
}
