# $Id$
# Contributor: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_name=kubergrunt
pkgname=kubergrunt
pkgver=0.7.10
pkgrel=1
pkgdesc="Kubergrunt is a standalone go binary with a collection of commands to fill in the gaps between Terraform, Helm, and Kubectl"
arch=('x86_64')
url="https://github.com/gruntwork-io/kubergrunt"
optdepends=('terraform' 
            'kubectl' 
            'helm'
          )
license=('Apache-2')
source=("https://github.com/gruntwork-io/${_name}/releases/download/v${pkgver}/${_name}_linux_amd64")
sha256sums=('f65e827dc9d51c61d307e558b777788eb5556d7f9ef0f496c97c58ed620759c2')

package() {
  cd "${srcdir}"
  install -Dm755 ${_name}_linux_amd64 ${pkgdir}/usr/bin/${_name}
}
