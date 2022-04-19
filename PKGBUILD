# Maintainer: mindnightix <midnightix@protonmail.com>

pkgname=clash-verge-bin
_pkgname=clash-verge
pkgver=0.0.29
pkgrel=2
pkgdesc="A Clash GUI based on tauri."
arch=('x86_64')
url="https://github.com/zzzgydi/clash-verge"
license=('GPL3')
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3')
provides=('clash')
conflicts=('clash')
source=("${_pkgname}-${pkgver}-${arch}.deb::https://github.com/zzzgydi/clash-verge/releases/download/v${pkgver}/clash-verge_${pkgver}_amd64.deb")

sha512sums=('57b38e22c54d622c365a12f6d807850742a2edfd2d51804babe872b3b7292ee4f24da649cff911ff6d59a30e316e3340bb31f60ed1b5f20b69051322bcc9af1b')

package() {
	tar xpf data.tar.gz -C ${pkgdir}
}
