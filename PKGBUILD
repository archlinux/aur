# Maintainer: robertfoster

pkgname=simonpi
pkgver=2.0.0
pkgrel=1
pkgdesc="A quick & dirty script to emulate Raspberry PI family devices on your laptop"
arch=(any)
url="https://github.com/M0Rf30/simonpi"
license=('GPL3')
depends=(
  'coreutils'
  'dnsmasq'
  'dosfstools'
  'e2fsprogs'
  'edk2-aarch64'
  'edk2-arm'
  'file'
  'grep'
  'iproute2'
  'iptables'
  'libarchive'
  'procps-ng'
  'qemu-system-aarch64'
  'qemu-system-arm'
  'sudo'
  'util-linux'
  'wget'
)
install="${pkgname}.install"
source=("${url}/archive/$pkgver.tar.gz")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
}

sha256sums=('7c258c4dc2791a42e9b773934a285d4970673caf5a6d9a1bd28b6d8a8a36fd11')
