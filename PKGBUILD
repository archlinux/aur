# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=gasconheart
pkgver=v0.3
pkgrel=1
pkgdesc="Install gasconheart on your computer. This is a simulacrum of gasconheart in a single shell script file."
url="https://www.chats.dot.org.es/"
license=('MIT')
arch=('any')
md5sums=('SKIP')
makedepends=(git)
depends=(bash lolcat figlet)
provides=(gasconheart)
source=('gasconheart.sh')

package () {
  install -Dm755 gasconheart.sh "${pkgdir}/usr/bin/gasconheart"
}
