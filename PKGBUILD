pkgname=play-in-mpv
pkgver=1.0.3
pkgrel=1
pkgdesc='Play Bilibili video in mpv player.'
url='https://github.com/diannaojiang/Bilibili-Playin-Mpv'
arch=('x86_64')
source=(
"${url}/releases/download/v${pkgver}/Bilibili-Playin-Mpv.v1.0.Linux.x86_64.zip"
"playinmpv.desktop"	
)

package() {
	install -d "${pkgdir}/usr/bin/"
	install -d "${pkgdir}/usr/share/applications/"
	install -Dm755 "${srcdir}/playinmpv" "${pkgdir}/usr/bin/"
	install -Dm755 "${srcdir}/playinmpv.desktop" "${pkgdir}/usr/share/applications/"
}

sha256sums=('79eadc9c8c3076d487babd21ef74f087515dca9a94f675a75957b29ceff0ac59'
            'c7ec7c461845bdbf3f47ee2fffee659d7bcd4a4fc9b6d6b683c91ee5bedd08de')
