# Maintainer: Matthew Daubert <mdaubert@gmail.com>

pkgname="deis-workflow-cli-bin"
pkgver=2.10.0
pkgrel=1
pkgdesc="Deis Workflow CLI is a command line utility used to interact with the Deis open source PaaS"
arch=('x86_64')
url="https://github.com/deis/workflow-cli"
license=('APACHE')
makedepends=()
source=("https://storage.googleapis.com/workflow-cli-release/v${pkgver}/deis-v${pkgver}-linux-amd64")
sha256sums=('cd91cf557a57bbca3d4e15eb1f5ba7b6063b1182a5f88fc6ad474571e7910bc5')
md5sums=('f597d30230847e2b59afe88471e62a15')

package() {
  cd "${srcdir}"
  install -Dm755 deis-v${pkgver}-linux-amd64 "${pkgdir}/usr/bin/deis"
}
