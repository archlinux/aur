# Maintainer: ffqq <shuttara@gmail.com>
pkgname=liteaur
pkgver=1.2
pkgrel=1
pkgdesc="LiteAUR: The shell script light-weight AUR helper"
arch=('i686' 'x86_64')
url="https://gitlab.com/TechSour12/liteaur"
license=('GPL3')
depends=('pacman' 'git')
optdepends=('doas' 'sudo')
provides=(liteaur)
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/TechSour12/liteaur/-/archive/v${pkgver}/liteaur-v${pkgver}.tar.gz")
noextract=()
md5sums=("d4c30803bc8e423b8185f2c3f717afcb")
validpgpkeys=()

package() {
	cd "$pkgname-v$pkgver"
	install -D -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
