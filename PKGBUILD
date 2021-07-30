# Maintainer: eNV25 <env252525@gmail.com>
# Contributor: Sergey Zolotorev <sergey.zolotorev@gmail.com>

pkgname=pacman-hook-kernel-install
pkgver=0.2.1
pkgrel=2
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
sha256sums=('a2b5181c48d0891094e1aff85057de48cf4e7db619a9d073cf20b3e20a35785c'
            '9e5c1141acc66205d358b50328266e47f180e16f09f11d411a8bc2382865809d')
