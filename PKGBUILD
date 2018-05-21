# Contributor: Stephen Brown II <Stephen [dot] Brown2 [at] gmail.com>
pkgname=bitwarden-cli
pkgver=0.3.0
pkgrel=1
pkgdesc="The command line vault (Windows, macOS, & Linux). bitwarden.com"
arch=('x86_64')
url="https://bitwarden.com"
license=('GPL')
groups=('')
depends=('')
options=('!strip') # '!emptydirs')
source_x86_64=("https://github.com/bitwarden/cli/releases/download/v${pkgver}/bw-linux.zip")
sha256sums_x86_64=('7E599AAC3127E5DB0DEF4E33906E649E16DFCFF10FEDD42D664ED9898B14C452')

package(){
  install -D "${srcdir}/bw" "${pkgdir}/usr/local/bin/bw"
}
