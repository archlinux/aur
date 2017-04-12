# Maintainer: Matthew Daubert <mdaubert@gmail.com>

pkgname="deis-workflow-cli-bin"
pkgver=2.13.0
pkgrel=1
pkgdesc="Deis Workflow CLI is a command line utility used to interact with the Deis open source PaaS"
arch=('x86_64')
url="https://github.com/deis/workflow-cli"
license=('APACHE')
makedepends=()
source=("https://storage.googleapis.com/workflow-cli-release/v${pkgver}/deis-v${pkgver}-linux-amd64")
sha256sums=('80399d5bed755baa0b6c871d6f6c401154d58f7b37b6fd9771b6f1ea233f5b1e')
md5sums=('c76a6f90364165ddf0e5fb04eb52f255')

package() {
  cd "${srcdir}"
  install -Dm755 deis-v${pkgver}-linux-amd64 "${pkgdir}/usr/bin/deis"
}
