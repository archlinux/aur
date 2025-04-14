pkgname=autocommit-bin
pkgver=0.1.23
pkgrel=5
pkgdesc="A tiny Bash script that watches your Git repo, detects changes, and commits them automatically."
arch=('any')
url="https://github.com/CraftyRobot/autocommit"
license=('MIT')
provides=('autocommit')
conflicts=('autocommit')
source=("https://github.com/CraftyRobot/autocommit/releases/download/v${pkgver}/autocommit_${pkgver}_all.deb")
sha256sums=('SKIP')

package() {
  mkdir -p extracted
  bsdtar -xf "${srcdir}/autocommit_${pkgver}_all.deb" -C extracted
  bsdtar -xf extracted/data.tar.zst -C "${pkgdir}"
}
