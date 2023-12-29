pkgname=zero-k
pkgver=1.0
pkgrel=3
pkgdesc="Open source RTS game running on the Spring engine"
arch=('x86_64')
url="https://zerok.itch.io/zero-k"
license=('GPL2')
depends=('mono')
install=zero-k.install
source=("https://zero-k.info/lobby/Zero-K.exe"
	"Zero-K.desktop"
	"Zero-K.png")
sha256sums=('651fa50d02483cd6e90131666bc62754a25d60091f454fb332685e14a47dac61'
            'a58bdd9083bedea8d32d0523f49f2ff016e48e7b58762e4d4cad3b3b01ce012f'
            '5ef8f0004a08fa0e94fccdbf1e1682132aa4e89af5b493c464742d51bf52368f')
        
package() {
  	mkdir -p "${pkgdir}/opt/${pkgname}" 
	chmod 777 "${pkgdir}/opt/${pkgname}" 
	install -Dm755 "${srcdir}/Zero-K.exe"		"${pkgdir}/opt/${pkgname}/Zero-K.exe"
	install -Dm644 "${srcdir}/Zero-K.desktop"	"${pkgdir}/usr/share/applications/Zero-K.desktop"
	install -Dm644 "${srcdir}/Zero-K.png"		"${pkgdir}/usr/share/pixmaps/Zero-K.png"
}
