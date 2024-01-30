# Maintainer: Neokobase-Anstari <okobenoko@outlook.com>

pkgname=nyalcf-bin
pkgver=0.1.6
pkgrel=1
pkgdesc='Nya LoCyanFrp! Launcher | 乐青映射启动器'
arch=('x86_64')
url="https://github.com/Muska-Ami/NyaLCF"
license=('MIT')
depends=('gtk3')
source=("$url/releases/download/v$pkgver/nyalcf-$pkgver+$pkgver-linux.deb")
# source=("https://slink.ltd/$url/releases/download/v$pkgver/nyalcf-$pkgver+$pkgver-linux.deb") # Mirror link
sha256sums=('83f4f6af575117f793fbd5446d106981312f3577e0d9d11b05efb1b08984e753')

package() {
	bsdtar -xvf data.tar.zst -C "${pkgdir}/"
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s "/usr/share/nyanana/nyanana" "${pkgdir}/usr/bin/nyanana"
}
