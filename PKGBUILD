# Maintainer: Konrad Tegtmeier <konrad.tegtmeier+aur@gmail.com>
# Contributor: Wojtek Gawroński <afronski@gmail.com>

pkgname=nomad-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="A distributed, highly available, datacenter-aware scheduler"
arch=('x86_64')
url="https://nomadproject.io/"
license=('MPL2')
optdepends=('docker: enables docker driver'
            'java-runtime: enables java driver'
            'lxc: enables lxc driver (experimental)'
            'qemu-headless: enables qemu driver'
            'rkt: enables rkt driver')
provides=('nomad')
source=("https://releases.hashicorp.com/nomad/${pkgver}/nomad_${pkgver}_linux_amd64-lxc.zip")
sha256sums=('ddbd66050b4597a0e4f1a2cb95af2b9bf3602caa23b953dd910e420a3100a080')

package() {
  install -Dm0755 nomad "${pkgdir}/usr/bin/nomad"
}
