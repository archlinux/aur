# Maintainer: Matthew Daubert <mdaubert@gmail.com>

pkgname="deis-workflow-cli-bin"
pkgver=2.16.0
pkgrel=1
pkgdesc="Deis Workflow CLI is a command line utility used to interact with the Deis open source PaaS"
arch=('x86_64')
url="https://github.com/deis/workflow-cli"
license=('APACHE')
makedepends=()
source=("https://storage.googleapis.com/workflow-cli-release/v${pkgver}/deis-v${pkgver}-linux-amd64")
sha256sums=('1451fb88675a1152cfeb78dbabdb678b57f181d0e5515e4d9c945ad6673b0d99')
md5sums=('c12a6fe95ef9572e4190c8a4964d8de3')

package() {
  cd "${srcdir}"
  install -Dm755 deis-v${pkgver}-linux-amd64 "${pkgdir}/usr/bin/deis"
}
