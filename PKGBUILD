# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=kubergrunt
pkgver=0.9.0
pkgrel=2
pkgdesc="Kubergrunt is a standalone go binary with a collection of commands to fill in the gaps between Terraform, Helm, and Kubectl"
arch=('x86_64')
url="https://github.com/gruntwork-io/kubergrunt"
optdepends=('terraform' 
            'kubectl' 
            'helm'
          )
license=('Apache-2')
source=("https://github.com/gruntwork-io/${pkgname}/releases/download/v${pkgver}/${pkgname}_linux_amd64")
sha256sums=('279f895eb9b29595ae795a6e7587ade6a8a3b95c74b4497ce795f75da20793ef')

package() {
  cd "${srcdir}"
  install -Dm755 ${pkgname}_linux_amd64 ${pkgdir}/usr/bin/${pkgname}
}
