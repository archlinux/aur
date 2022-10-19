# Maintainer: Bao Trinh <qubidt@gmail.com>

pkgname=nomad-device-nvidia-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='Nomad device driver for Nvidia GPU'
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://github.com/hashicorp/nomad-device-nvidia"
license=('MPL2')
provides=('nomad-device-nvidia')
changelog=nomad-device-nvidia.changelog
source_i686=("https://releases.hashicorp.com/nomad-device-nvidia/${pkgver}/nomad-device-nvidia_${pkgver}_linux_386.zip")
source_x86_64=("https://releases.hashicorp.com/nomad-device-nvidia/${pkgver}/nomad-device-nvidia_${pkgver}_linux_amd64.zip")
source_arm=("https://releases.hashicorp.com/nomad-device-nvidia/${pkgver}/nomad-device-nvidia_${pkgver}_linux_arm.zip")
source_aarch64=("https://releases.hashicorp.com/nomad-device-nvidia/${pkgver}/nomad-device-nvidia_${pkgver}_linux_arm64.zip")

sha256sums_i686=('70f9096deee98bcf3adc68e6e032be45e93153e9822a17965cbba5d1b555d9db')
sha256sums_x86_64=('74646b955c7ed6d4177e9c4f394d3153b1e196fad5ce5201ed2a3a5aca52a47d')
sha256sums_arm=('6bfdc3d8492dde6cf65ae7968eafffebf203b76697faf98b49f8edf761697903')
sha256sums_aarch64=('97853a37df92282b19befcc47851ea661069622f37ca4c19d7be32f381c3cacd')
options=('!strip')

package() {
  cd "$srcdir"
  install -Dm755 nomad-device-nvidia "$pkgdir"/usr/lib/nomad/plugins/nomad-device-nvidia
}
