# Maintainer: LiveLM <livelm at hotmail dot com> 
# Maintainer: CptSparrow < discordbotdupont at protonmail dot com >
pkgname=emusak-bin
pkgver=1.0.84
pkgrel=1
pkgdesc="Allows you to download saves and shaders for Switch emulators."
arch=(x86_64)
url="https://github.com/stromcon/emusak-ui"
license=('GPL3')
depends=(expat glib2 nss gtk3)
source=("https://github.com/stromcon/emusak-ui/releases/download/v$pkgver/emusak_${pkgver}_amd64.deb")
sha256sums=('1db85a895bb0b3a9b7378c2640a92b17e065c22b58bc52571ec7314688cb20ba')

build(){
	tar -xvf data.tar.xz
}

package() {
	cp -r usr "$pkgdir"
}
