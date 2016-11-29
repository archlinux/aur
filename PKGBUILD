# Maintainer: Matthew Daubert <mdaubert@gmail.com>

pkgname="deis-workflow-cli-bin"
pkgver=2.9.0
pkgrel=1
pkgdesc="Deis Workflow CLI is a command line utility used to interact with the Deis open source PaaS"
arch=('x86_64')
url="https://github.com/deis/workflow-cli"
license=('APACHE')
makedepends=()
source=("https://storage.googleapis.com/workflow-cli-release/v${pkgver}/deis-v${pkgver}-linux-amd64")
sha256sums=('4b57f7930febc1712a9f333f7496419585fe1571e8a86dadc595d9fb6f821c38')
md5sums=('64c5f75e0f756e3d9e9a1f3974f09295')

package() {
  cd "${srcdir}"
  install -Dm755 deis-v${pkgver}-linux-amd64 "${pkgdir}/usr/bin/deis"
}
