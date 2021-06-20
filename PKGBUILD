# Maintainer: eNV25 <bkvikag8k@relay.firefox.com>
# Contributor: Sergey Zolotorev <sergey.zolotorev@gmail.com>

pkgname=pacman-hook-kernel-install
pkgver=0.2.0
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
sha256sums=('5dc144ce6fb228d25f93f5ea5782575052a28ecc40f5fb261d94158f95ce965a'
            '902833c085cdb80eceb9ee7f34a117bea89ea1cc79aa5f4dbae1e184e5b43fd5')
