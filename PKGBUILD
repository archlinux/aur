# Contributor: Stephen Brown II <Stephen [dot] Brown2 [at] gmail.com>
pkgname=bitwarden-cli
pkgver=1.3.0
pkgrel=1
pkgdesc="The command line vault (Windows, macOS, & Linux). bitwarden.com"
arch=('x86_64')
url="https://bitwarden.com"
license=('GPL3')
options=('!strip')
source_x86_64=("https://github.com/bitwarden/cli/releases/download/v${pkgver}/bw-linux-${pkgver}.zip")
sha512sums_x86_64=('b2b7cce07085009e3d26ad2da70310d3af0a3e6129d399278e494eb455a930d6953c1c57f85659ac0eac35747da91005f3a50d5a260ff8e6e57a9d756e96e978')

package(){
  install -D "${srcdir}/bw" "${pkgdir}/usr/bin/bw"
}
