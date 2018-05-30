# Contributor: Stephen Brown II <Stephen [dot] Brown2 [at] gmail.com>
pkgname=bitwarden-cli
pkgver=1.0.1
pkgrel=1
pkgdesc="The command line vault (Windows, macOS, & Linux). bitwarden.com"
arch=('x86_64')
url="https://bitwarden.com"
license=('GPL')
options=('!strip')
source_x86_64=("https://github.com/bitwarden/cli/releases/download/v${pkgver}/bw-linux-${pkgver}.zip")
sha256sums_x86_64=('1eaccea82f9262b530c7ec53c6de56642a6c35c229f4b5b10bcf3a7c64ac6419')

package(){
  install -D "${srcdir}/bw" "${pkgdir}/usr/bin/bw"
}
