# Maintainer: ffqq <shuttara@gmail.com>
pkgname=liteaur
pkgver=1.5.5
pkgrel=1
pkgdesc="LiteAUR: Just another AUR helper"
arch=('any')
url="https://gitea.com/ffqq/liteaur"
license=('GPL3')
depends=('pacman' 'git')
optdepends=('sudo')
source=("LiteAUR-v${pkgver}.tar.gz::https://gitea.com/ffqq/LiteAUR/archive/v${pkgver}.tar.gz")
noextract=()
md5sums=("SKIP")

package() {
	cd "v$pkgver"
	install -D -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
