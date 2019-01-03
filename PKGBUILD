# Maintainer: Denton Liu <liu.denton@gmail.com>
# Hooks: https://wiki.archlinux.org/index.php/Dash#Relinking_/bin/sh
pkgname=sh-dash-replaces-bash-hook
pkgver=1.0.0
pkgrel=1
pkgdesc="Replaces the /bin/sh symlink with dash when bash is upgraded"
arch=('any')
license=('FDL1.3')
depends=('bash' 'dash')
source=("relink-sh.hook")
sha256sums=("6a614c60c7ca1a2c4f604b9b4a24a6d2a9bb197776cde8d0e071311d9716a97b")

package() {
	install -Dm644 "${srcdir}/relink-sh.hook" "${pkgdir}/usr/share/libalpm/hooks/relink-sh.hook"
}
