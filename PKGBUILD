# Maintainer: Tsiry Sandratraina <tsiry.sndr@fluentci.io>

pkgname=envhub-bin
pkgver=0.2.18
pkgrel=1
pkgdesc="Manage your dotfiles, secrets and packages with ease. Define your \$HOME as Code and re-use it everywhere (local machine, CI, server ...) 💻 🚀 ✨"
arch=('x86_64')
url="https://github.com/tsirysndr/envhub"
source=("$url/releases/download/v${pkgver/_/-}/envhub_v${pkgver/_/-}_x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('7ec1aebdfc753564b033a2ee8ff1bd402ef457700c41e80cb058ec9b90e9d87a')
license=('MPL-2.0')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  tar xvf "${srcdir}/envhub_v${pkgver}_x86_64-unknown-linux-gnu.tar.gz" -C "${pkgdir}/usr/bin"
}