# Maintainer: asukaminato <asukaminato@nyan.eu.org>
pkgname=deeplx-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Permanently free DeepL API written in Golang"
arch=('x86_64' 'i386' 'aarch64' 'mips')
url="https://github.com/OwO-Network/DeepLX"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
source=('https://raw.githubusercontent.com/OwO-Network/DeepLX/main/deeplx.service')
source_x86_64=("deeplx::https://github.com/OwO-Network/DeepLX/releases/download/v$pkgver/deeplx_linux_amd64")
source_aarch64=("deeplx::https://github.com/OwO-Network/DeepLX/releases/download/v$pkgver/deeplx_linux_arm64")
source_i386=("deeplx::https://github.com/OwO-Network/DeepLX/releases/download/v$pkgver/deeplx_linux_386")
source_mips=("deeplx::https://github.com/OwO-Network/DeepLX/releases/download/v$pkgver/deeplx_linux_mips")
noextract=()
sha256sums=('e06011c76c1582b559c211d325eb50b646abac8a564b34e2cfb953c5a52fcfeb')
sha256sums_x86_64=('b7d5945902ca41059587caff1350c0cf69ede2ba66509c6462a1f0896332106d')
sha256sums_i386=('b7d5945902ca41059587caff1350c0cf69ede2ba66509c6462a1f0896332106d')
sha256sums_aarch64=('b7d5945902ca41059587caff1350c0cf69ede2ba66509c6462a1f0896332106d')
sha256sums_mips=('b7d5945902ca41059587caff1350c0cf69ede2ba66509c6462a1f0896332106d')
validpgpkeys=()


package() {
		install -Dm755 deeplx -t ${pkgdir}/usr/bin/
		install -Dm644 deeplx.service -t ${pkgdir}/etc/systemd/system/
}
