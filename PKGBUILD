# Maintainer: Neokobase-Anstari <okobenoko@outlook.com>

pkgname=nyalcf-bin
pkgver=0.1.5
pkgrel=1
pkgdesc='Nya LoCyanFrp! Launcher | 乐青映射启动器'
arch=('x86_64')
url="https://github.com/Muska-Ami/NyaLCF"
license=('MIT')
depends=('gtk3')
source=("$url/releases/download/v$pkgver/nyalcf-$pkgver+$pkgver-linux.deb")
sha256sums=('d59e0444470e58c15580130c940ebab08ebd992d6eff26f243cbe55be6e63781')

package() {
	bsdtar -xvf data.tar.zst -C "${pkgdir}/"
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s "/usr/share/nyanana/nyanana" "${pkgdir}/usr/bin/nyanana"
}
