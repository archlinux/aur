# Author && Contributor && Maintarner: Swift Geek <swiftgeek ɐt gmail døt com>

pkgname=changeling
pkgver=0
pkgrel=7
pkgdesc="Change just version of any package"
url='https://gist.github.com/swiftgeek/570d3ff3e700f8699c16'
arch=('any')
license=('GPL-2.0-only')
depends=('awk' 'bash' 'coreutils' 'grep' 'pacman' 'procps-ng' 'sed' 'sudo')
source=("https://gist.github.com/swiftgeek/570d3ff3e700f8699c16/raw/a67c01b074bc5537c7a2a19e8c51943186bdba9c/changeling.sh")
md5sums=('0a9aa6c19cf838bc595eb929e213375e')
package() {
  install -d "${pkgdir}"/usr/bin
  install -m755 "${srcdir}/changeling.sh" "${pkgdir}"/usr/bin/changeling
}
