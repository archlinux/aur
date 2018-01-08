# Maintainer: vimacs <https://vimacs.lcpu.club>
pkgname=mkinitcpio-install-tools
pkgver=1.0
pkgrel=1
pkgdesc="build an initramfs that can bootstrap Arch"
arch=(x86_64)
url='https://www.archlinux.org'
license=('GPL')
depends=('btrfs-progs' 'curl' 'wget' 'bind-tools' 'mkinitcpio-nfs-utils')
source=('install-tools' 'install-tools.preset')
sha256sums=('7e5bd15a73fde3dc3f9fd193454e2e66cea8710690caecec22231348d15d1613'
            'd8c1846236dbe41f0647aec00670c8de48d3dd72b3d60c63b513bbbe03354a69')

build() {
	true
}

package() {
	install -D -m 644 install-tools.preset "$pkgdir/etc/mkinitcpio.d/install-tools.preset"
	install -D -m 644 install-tools "$pkgdir/usr/lib/initcpio/install/install-tools"
}

