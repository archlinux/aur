# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=kubernetes-helmfile-bin
pkgver=${VERSION}
pkgrel=${PKGREL}
pkgdesc="Deploy Kubernetes Helm Charts"
url="https://github.com/helmfile/helmfile"
license=('MIT')
arch=('x86_64' 'aarch64' 'i486' 'i686')
depends=('helm')

source_x86_64=("helmfile_linux_${pkgver}_x86_64::https://github.com/helmfile/helmfile/releases/download/v${pkgver}/helmfile_${pkgver}_linux_amd64.tar.gz")
source_i486=("helmfile_linux_${pkgver}_i486::https://github.com/helmfile/helmfile/releases/download/v${pkgver}/helmfile_${pkgver}_linux_386.tar.gz")
source_i686=("helmfile_linux_${pkgver}_i686::https://github.com/helmfile/helmfile/releases/download/v${pkgver}/helmfile_${pkgver}_linux_386.tar.gz")
source_aarch64=("helmfile_linux_${pkgver}_aarch64::https://github.com/helmfile/helmfile/releases/download/v${pkgver}/helmfile_${pkgver}_linux_arm64.tar.gz")

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/usr/bin"
  install -m755 helmfile "${pkgdir}/usr/bin/helmfile"
}

