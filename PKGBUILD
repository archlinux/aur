# Maintainer: tkit <ch1994@outlook.com>
pkgname=codium-nautilus-git
pkgver=r9.ddff975
pkgrel=2
pkgdesc="VSCodium extension for Nautilus"
arch=('i686' 'x86_64')
url="https://github.com/Gyro7/codium-nautilus"
license=('custom')
depends=('python-nautilus')
makedepends=('git')
optdepends=('codium: The Visual Studio Codium editor')
install="${pkgname}.install"
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

package() {
    wget -q https://raw.githubusercontent.com/Gyro7/codium-nautilus/master/install.sh -O - | bash
}
