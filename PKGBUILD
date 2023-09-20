# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgver=2.0.0
pkgname=myks-bin
pkgrel=1
pkgdesc='Configuration framework for managing Kubernetes clusters'
provides=(myks)
conflicts=(myks myks-bin myks-git)
arch=(x86_64 aarch64)
url="https://github.com/mykso/myks"
license=('MIT')

source_x86_64=("myks_2.0.0_linux_amd64.tar.gz::https://github.com/mykso/myks/releases/download/v2.0.0/myks_2.0.0_linux_amd64.tar.gz")
sha256sums_x86_64=("8906b28c16b396f2e2e6b39b34189aa0ad0d2caaa0b17cb854b7b37bb944a8b5")

source_aarch64=("myks_2.0.0_linux_arm64.tar.gz::https://github.com/mykso/myks/releases/download/v2.0.0/myks_2.0.0_linux_arm64.tar.gz")
sha256sums_aarch64=("f220231cd092911bd323de224d210b6c28bf8ddb6d4b2d193ce2f3fa54d23a2c")

package() {
  install -Dm755 "${srcdir}/myks" "${pkgdir}/usr/bin/myks"
}
