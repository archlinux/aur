# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=1.7.6
pkgrel=3
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
conflicts=("$_pkgname" "$_pkgname-alpha" "$_pkgname-alpha-bin" "$_pkgname-git" "clash-verge" "clash-verge-bin")
install=.install

source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_amd64.deb")
source_i686=("${_pkgname}-${pkgver}-i686.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_i386.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_arm64.deb")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_armhf.deb")

sha512sums_x86_64=('ecf8a00ccad76b67a5a7a8cfe5230e5d19587814aaa77dcf0a6f85e21f296c2cccf6169a17752a63c82a2a63b67bd4f047b67f8292e70af9134437789f308bc2')
sha512sums_i686=('b2c2f3212d5d44ccef61744b24ef8e9df35bc3445c749601c2dc518ead032056d1fb5a22c56554c99a269513ce9020efe31aec9c1ae63fd32551c4bdd1076912')
sha512sums_aarch64=('8683cacd7c67fec9c36bdd91f21d6e1fb1df5452efbe5caa3ad3c2e63a1526586169aaadac71ae55e6d9c44ee511f9115db824bf736af60fe39470b5f5c9afd4')
sha512sums_armv7h=('53f8bcebf363ccef2e7ca163ea24fb66abbd4229d75a0a9dc7f10fdc1cbaa8da5857173cd0c99800e13d790732112a5748288d87a8e86fd210c012c3c05b5d14')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
