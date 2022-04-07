# Maintainer : Stezkoy <stezko@gmail.com>

pkgname=pastemc
pkgdesc="Bash script for paste MasCloud. Fork pbin"
url="https://github.com/Stezkoy/pbin"
pkgver=1.0
pkgrel=3
arch=('any')
license=("custom")
depends=('bash' 'curl')
options=(!strip)
source=(pastemc)
md5sums=('8f9be7d8d91c58a9944b6b84b7a763f6')


package() {
 mkdir -p "${pkgdir}"/usr/bin

 install -D -m755 pastemc "${pkgdir}"/usr/bin/
          }
