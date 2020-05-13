# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Fancy <springzfx at gmail.com>

pkgbase=lx-music-desktop
pkgname=('lx-music-desktop-bin')
pkgver=0.18.2
pkgrel=1
pkgdesc="A music software based on Electron + Vue. 一个基于 Electron + Vue 开发的音乐软件。"
arch=('x86_64')
url="https://github.com/lyswhut/lx-music-desktop"
license=('')
groups=('')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'libutil-linux' 'at-spi2-core' 'libappindicator-gtk3' 'libsecret')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/lyswhut/lx-music-desktop/releases/download/v$pkgver/lx-music-desktop.v$pkgver.x64.deb")
sha512sums_x86_64=('b53760c1fba3a4c0403ff32a382d4ed0d33f6784afd3eb31cc0368eb258cf13423b0fa765f7448224784b6ddaf01555138514c9194989d9738223ace69f0e305')

package_lx-music-desktop-bin(){
	tar xf data.tar.xz -C "${pkgdir}"
}
