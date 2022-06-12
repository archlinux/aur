# Maintainer: Your Name <youremail@domain.com>

pkgname=mkinitcpio-systemd-root-password
pkgver=0.1.0
pkgrel=1
pkgdesc='The root user in the initramfs-image have been locked, without a option to unlock it by setting a password 😢 This mkinitcpio module is made to add the option to unlock the root user in the initramfs-image.'
arch=('any')
url='https://aur.archlinux.org/packages/mkinitcpio-systemd-root-password'
license=('BSD0')
groups=()
depends=('systemd')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
options=()
source=('systemd-root-password')
noextract=()
sha256sums=('3c6e8c7d0fced8df535eac4939b833745c766b4350637a24989ccc4a505abac6')

#prepare() {
#	cd "$pkgname-$pkgver"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

#build() {
#	cd "$pkgname-$pkgver"
#	./configure --prefix=/usr
#	make
#}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
    install -Dm644 "systemd-root-password" "${pkgdir}/usr/lib/initcpio/install/systemd-root-password"
}

