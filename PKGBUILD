# Contributor: Liziqian <liziqian99@gmail.com>
# Maintainer: NameSetter <namesetter@outlook.com>

pkgname=fuckcomputer-utils-py
pkgver=1.0.0
pkgrel=1
pkgdesc="A program to destroy your computer."
arch=('any')
url="https://github.com/FuckComputer/FuckComputer-Python"
license=('GPL3')
depends=('python')
provides=('fuckcomputer-utils')
conflicts=()
source=($pkgname::"https://github.com/FuckComputer/FuckComputer-Python/releases/download/v${pkgver}/fuckcomputer")
md5sums=('898ce5898f9ce36f7fe408ab3783b524')

package() {
  mv $pkgname fuckcomputer
  mkdir -p "${pkgdir}/usr/bin"
  install -m=755 fuckcomputer "${pkgdir}/usr/bin"
}
