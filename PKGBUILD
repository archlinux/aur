# $Id$
# Contributor: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_name=kubergrunt
pkgname=kubergrunt
pkgver=0.7.9
pkgrel=1
pkgdesc="Kubergrunt is a standalone go binary with a collection of commands to fill in the gaps between Terraform, Helm, and Kubectl"
arch=('x86_64')
url="https://github.com/gruntwork-io/kubergrunt"
license=('Apache-2')
source=("https://github.com/gruntwork-io/${_name}/releases/download/v${pkgver}/${_name}_linux_amd64")
sha256sums=('c6c75248e72ecdfecfe5a6b2018491d0301589da4772345457860ad67bffcfb7')

package() {
  cd "${srcdir}"
  install -Dm755 ${_name}_linux_amd64 ${pkgdir}/usr/bin/${_name}
}