# Maintainer: eNV25 <env252525@gmail.com>
# Contributor: Sergey Zolotorev <sergey.zolotorev@gmail.com>

pkgname=pacman-hook-kernel-install
pkgver=0.4.0
pkgrel=1
pkgdesc="Pacman hooks for kernel-install."
url='https://man.archlinux.org/man/kernel-install.8'
arch=('any')
license=('GPL')
depends=('bash' 'systemd')
source=(
	'90-kernel-install-add.hook'
	'90-kernel-install-remove.hook'
)

package() {
	install -Dm644 '90-kernel-install-add.hook' '90-kernel-install-remove.hook' \
		-t"${pkgdir}/usr/share/libalpm/hooks"
}

# sums
sha256sums=('44f46cc566ff194a033daa2c1a755f387838e68520d4ef8da41730813fc3619d'
            '38f7019c229403a40d04b2f253a17f7644ceb5d67d499f199e9e324d44b432c5')
