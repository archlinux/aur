# Contributor: Stephen Brown II <Stephen [dot] Brown2 [at] gmail.com>
pkgname=bitwarden-cli
pkgver=1.2.0
pkgrel=1
pkgdesc="The command line vault (Windows, macOS, & Linux). bitwarden.com"
arch=('x86_64')
url="https://bitwarden.com"
license=('GPL3')
options=('!strip')
source_x86_64=("https://github.com/bitwarden/cli/releases/download/v${pkgver}/bw-linux-${pkgver}.zip")
sha512sums_x86_64=('1f963c5774034c1fa64a085a4c3a445b46178282632506b270c619ce6740d10e330d576c6dff075395542749655d74c066da1b49610478f99f42524983f24759')

package(){
  install -D "${srcdir}/bw" "${pkgdir}/usr/bin/bw"
}
