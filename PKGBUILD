# Maintainer: Josh Gwosdz <jgwosdz@redhat.com>
pkgname=kubeflow-kfctl-bin
pkgver=1.2.0
_commit=gbc038f9
pkgrel=1
pkgdesc="A tool to control and manage Kubeflow deployments"
arch=('x86_64')
url="https://github.com/kubeflow/kfctl"
depends=()
makedepends=()
provides=('kubeflow-kfctl')
conflicts=('kubeflow-kfctl')
license=('Apache')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kubeflow/kfctl/releases/download/v${pkgver}/kfctl_v${pkgver}-0-${_commit}_linux.tar.gz")
sha256sums=('5e79d3eda986ed33fcab8536e038d566e90b8e990c9322b82843e1e2c54bb638')

package() {
  install -Dm755 "$srcdir/kfctl" -T "$pkgdir/usr/bin/kfctl"
}
