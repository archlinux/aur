# Maintainer: Matthew Daubert <mdaubert@gmail.com>

pkgname="deis-workflow-cli-bin"
pkgver=2.14.0
pkgrel=1
pkgdesc="Deis Workflow CLI is a command line utility used to interact with the Deis open source PaaS"
arch=('x86_64')
url="https://github.com/deis/workflow-cli"
license=('APACHE')
makedepends=()
source=("https://storage.googleapis.com/workflow-cli-release/v${pkgver}/deis-v${pkgver}-linux-amd64")
sha256sums=('9f15b351a4744086ccf4ef2e9c0ee589cf3cee5ce3df3c34eb11cc7b2e3e4c55')
md5sums=('96bf83509e62228c7004c5ed5bc446c6')

package() {
  cd "${srcdir}"
  install -Dm755 deis-v${pkgver}-linux-amd64 "${pkgdir}/usr/bin/deis"
}
