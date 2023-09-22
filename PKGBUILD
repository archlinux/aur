# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgver=2.0.1
pkgname=myks-bin
pkgrel=1
pkgdesc='Configuration framework for managing Kubernetes clusters'
provides=(myks)
conflicts=(myks myks-bin myks-git)
arch=(x86_64 aarch64)
url="https://github.com/mykso/myks"
license=('MIT')

source_x86_64=("myks_2.0.1_linux_amd64.tar.gz::https://github.com/mykso/myks/releases/download/v2.0.1/myks_2.0.1_linux_amd64.tar.gz")
sha256sums_x86_64=("7b224675686a03eea1c2c117e9efe2b9c17c899781d6416e8d33c20371743168")

source_aarch64=("myks_2.0.1_linux_arm64.tar.gz::https://github.com/mykso/myks/releases/download/v2.0.1/myks_2.0.1_linux_arm64.tar.gz")
sha256sums_aarch64=("983a987864258ec0427ea3abde03e88b1da48c7d4078901c72e7ab502c05ce8a")

package() {
  install -Dm755 "${srcdir}/myks" "${pkgdir}/usr/bin/myks"
}
