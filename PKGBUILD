pkgname=autocommit-bin
pkgver=0.1.24
pkgrel=1
pkgdesc="A tiny Bash script that watches your Git repo, detects changes, and commits them automatically."
arch=('any')
url="https://github.com/CraftyRobot/autocommit"
license=('MIT')
provides=('autocommit')
conflicts=('autocommit')
source=("https://github.com/CraftyRobot/autocommit/releases/download/v0.1.24/autocommit_0.1.24_all.deb")
sha256sums=('SKIP')

package() {
bsdtar -xf "${srcdir}/autocommit_${pkgver}_all.deb" -C "${pkgdir}"
}
