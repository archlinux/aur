# Maintainer: eNV25 <env252525@gmail.com>
# Contributor: Sergey Zolotorev <sergey.zolotorev@gmail.com>

pkgname=pacman-hook-kernel-install
pkgver=0.3.0
pkgrel=1
pkgdesc="Pacman hooks for kernel-install."
url='https://man.archlinux.org/man/kernel-install.8'
arch=('any')
license=('GPL')
depends=('bash' 'systemd')
source=(
	'kernel-install-add.hook'
	'kernel-install-remove.hook'
)

package() {
	install -Dm644 'kernel-install-add.hook' 'kernel-install-remove.hook' \
		-t"${pkgdir}/usr/share/libalpm/hooks"
}


# sums
sha256sums=('ca9d66fb7dad75087cd127232fe9d050ede2db9e8c0f988c80a78a31c495c115'
            '13a265c01a0c45026a9793b92288b8e7248f8d849863e44bdb1c8300cc0bb64c')
