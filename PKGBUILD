# Maintainer: Fancy <springzfx at gmail.com>
pkgname=lx-music-desktop
pkgver=0.8.2
pkgrel=1
pkgdesc="A music software based on Electron + Vue. 一个基于 Electron + Vue 开发的音乐软件。"
arch=('x86_64')
url="https://github.com/lyswhut/lx-music-desktop#readme"
license=('')
groups=('')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'libutil-linux' 'at-spi2-core' 'libappindicator-gtk3' 'libsecret')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/lyswhut/lx-music-desktop/releases/download/v0.7.0/lx-music-desktop.v0.7.0.x64.deb")
sha512sums_x86_64=('7e3c00f716b41f8471e33f40cf0d081224d1a1ae6bcca423a8c429a60bea1435a32fd94464eab8d95afd3d058dc57ab64fb939e87e46d8d1df363d80bfa8f44e')

package(){
	tar xf data.tar.xz -C "${pkgdir}"
}
