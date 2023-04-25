# Maintainer: Jia Yin <lok-ation@outlook.com>

pkgname="aria2-pro-core-bin"
pkgver="1.36.0"
pkgrel="1"
pkgdesc="Aria2 static binaries for GNU/Linux with some powerful feature patches."
arch=("x86_64" "i686" "aarch64" )
url="https://github.com/P3TERX/Aria2-Pro-Core"
depends=('gnutls' 'libxml2' 'sqlite' 'c-ares' 'ca-certificates' 'libssh2')
provides=('aria2')
conflicts=('aria2')
source=("LICENSE::https://raw.githubusercontent.com/P3TERX/Aria2-Pro-Core/master/LICENSE")
source_x86_64=(
		"${pkgname}-${pkgver}-${pkgrel}.tar.gz::${url}/releases/download/${pkgver}_2021.08.22/aria2-${pkgver}-static-linux-amd64.tar.gz"
		)
source_i686=(
		"${pkgname}-${pkgver}-${pkgrel}.tar.gz::${url}/releases/download/${pkgver}_2021.08.22/aria2-${pkgver}-static-linux-i386.tar.gz"
		)
source_aarch64=(
		"${pkgname}-${pkgver}-${pkgrel}.tar.gz::${url}/releases/download/${pkgver}_2021.08.22/aria2-${pkgver}-static-linux-arm64.tar.gz"
		)
license=('GPL3')
sha512sums=('d361e5e8201481c6346ee6a886592c51265112be550d5224f1a7a6e116255c2f1ab8788df579d9b8372ed7bfd19bac4b6e70e00b472642966ab5b319b99a2686')
sha512sums_x86_64=('3e3f46e46a9d28a39c2f1225932d7a45fffb103c3609e072bd40940bf25f6a9474f21c863cdb5b9b772d671e90d5fa5783a4b6a487cd1eca84753258f64b484a')
sha512sums_i686=('bed721ba23950d8c2dfa2b81c082d51af65227374caf5ff9c7531eacdc142a82d5183009a8b1c05ed5226747d95fc3dea8b237ad4b897a5ac82446d74b3ab2bf')
sha512sums_aarch64=('bb2e6435489e39ce5b7de97b313fa88618f011d785ee060f7d11f62b5dd6d1922fef2f453795bccb2504d0cb37609b08af43b6236066f660fa2d6dff17792539')
package() {
	mkdir -p "${pkgdir}/usr/bin"
	cd ${srcdir}
	install -Dm 755 aria2c ${pkgdir}/usr/bin/aria2c
}
