# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=1.7.4
pkgrel=1
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
conflicts=("$_pkgname" "$_pkgname-alpha" "$_pkgname-alpha-bin" "$_pkgname-git" "clash-verge" "clash-verge-bin" "clash-nyanpasu" "clash-nyanpasu-bin" "clash-nyanpasu-git" "clash-meta")

source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_amd64.deb")
source_i686=("${_pkgname}-${pkgver}-i686.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_i386.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_arm64.deb")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_armhf.deb")

sha512sums_x86_64=('ccb200615625162f1747fe1da69c32c8c6ef27cb5bdcb3dc50a241d0973d87f731cee362fd3ce4601b7e1ce35ed12f4cb8e7e4df384e004ceca6abbf24331f53')
sha512sums_i686=('bb5e176e557a0192a8fa43eed2cc90ea8313847ffeb3776db5d26dee3cccff54f0aa4a17207e16711eac4744c088ef8b3b34db99ae6bce7d622d8d05732ac8d8')
sha512sums_aarch64=('96941476a322639268cca5e4b204043798a908bd7d69b28045c84d8fc79c3fd225ac716a901c38a32626267bf518777e8c40c8d9a856a7efe9db888fb83e3f1d')
sha512sums_armv7h=('2cd2e883e29c67dd4cf7e47a22c007c47fb0da2bee521c14a35a776d6681e52a261044e4252617ab338b6fe42d285cbd08cc12a695b057b691006df3dba9ea40')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
