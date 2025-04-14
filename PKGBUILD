pkgname=autocommit-bin
pkgver=0.1.23
pkgrel=2
pkgdesc="A tiny Bash script that watches your Git repo, detects changes, and commits them automatically."
arch=('any')
url="https://github.com/CraftyRobot/autocommit"
license=('MIT')
provides=('autocommit')
conflicts=('autocommit')
source=("https://github.com/CraftyRobot/autocommit/releases/download/v${pkgver}/autocommit_${pkgver}_all.deb")
sha256sums=('SKIP')

package() {
  bsdtar -xf "${srcdir}/autocommit_${pkgver}_all.deb" -C "${srcdir}"
  install -Dm755 "${srcdir}/usr/local/bin/autocommit" "${pkgdir}/usr/bin/autocommit"
}
