# Contributor: Stephen Brown II <Stephen [dot] Brown2 [at] gmail.com>
pkgname=bitwarden-cli
pkgver=1.1.0
pkgrel=1
pkgdesc="The command line vault (Windows, macOS, & Linux). bitwarden.com"
arch=('x86_64')
url="https://bitwarden.com"
license=('GPL3')
options=('!strip')
source_x86_64=("https://github.com/bitwarden/cli/releases/download/v${pkgver}/bw-linux-${pkgver}.zip")
sha256sums_x86_64=('86a58dc02596c98a6b4f1f9faace2f20de270154b3f2de7320569a49ac273be7')

package(){
  install -D "${srcdir}/bw" "${pkgdir}/usr/bin/bw"
}
