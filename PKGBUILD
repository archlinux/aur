# Maintainer: Lena Fuhrimann

pkgname=pacmanfile
pkgver=0.0.4
pkgrel=1
pkgdesc='Manage your pacman packages declaratively'
arch=(x86_64 i686)
url="https://github.com/mastertinner/pacmanfile"
license=(Apache)
provides=(pacmanfile)
source=('https://raw.githubusercontent.com/mastertinner/pacmanfile/main/pacmanfile')
sha256sums=('c2936eb44a5181f4cca62f6c415986c170c7c1fe6d4407958452d6d899fb0cf8')

package() {
	install -Dm755 pacmanfile -t "${pkgdir}/usr/bin"
}
