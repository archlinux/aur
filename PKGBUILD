# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Fancy <springzfx at gmail.com>

pkgbase=lx-music-desktop
pkgname=('lx-music-desktop-bin')
pkgver=1.0.1
pkgrel=1
pkgdesc="A music software based on Electron + Vue. 一个基于 Electron + Vue 开发的音乐软件。"
arch=('x86_64')
url="https://github.com/lyswhut/lx-music-desktop"
license=('')
groups=('')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'libutil-linux' 'at-spi2-core' 'libappindicator-gtk3' 'libsecret')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/lyswhut/lx-music-desktop/releases/download/v$pkgver/lx-music-desktop.v$pkgver.x64.deb")
sha512sums_x86_64=('4bfb09978e8187bfd53642cbc08a2f3754931ae178a458f67a16cf6964af991e5b75a585729217076acc280db620b1824165d8fb34f2e5828f522192c39cce85')

package_lx-music-desktop-bin(){
	tar xf data.tar.xz -C "${pkgdir}"
}
