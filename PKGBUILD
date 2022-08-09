# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=kubernetes-helmfile-bin
pkgver=0.145.2
pkgrel=1
pkgdesc="Deploy Kubernetes Helm Charts"
url="https://github.com/roboll/helmfile"
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

sha256sums_x86_64=('95981de235334c0774df8101485c7b506cba5f6b0d9d3fa2dc6bf3220d28f45b')
sha256sums_aarch64=('7cd158b7ade21a538e0509eb6f2ee0c796c7c81012f6e22d9bb5f7565d5dc1c2')
sha256sums_i486=('54b8b9ed6e2aa45e93021152412f95cfd150254c88ce1140cc5f5288373faff8')
sha256sums_i686=('54b8b9ed6e2aa45e93021152412f95cfd150254c88ce1140cc5f5288373faff8')
