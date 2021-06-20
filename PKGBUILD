# Maintainer: eNV25 <bkvikag8k@relay.firefox.com>
# Contributor: Sergey Zolotorev <sergey.zolotorev@gmail.com>

pkgname=pacman-hook-kernel-install
pkgver=0.1.0
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
sha256sums=('5e88d45c31ca36e84c82024ad53664919a5b437a55dde1c472236b6af4deaeb7'
            '2b7ec6e815594a28cd8e7508afe881963be7e652da9f5f823f084ea3c5039b83')
