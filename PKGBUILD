# Maintainer: LiveLM <livelm at hotmail dot com> 
# Maintainer: CptSparrow < discordbotdupont at protonmail dot com >
pkgname=emusak-bin
pkgver=1.0.103
pkgrel=1
pkgdesc="Allows you to download saves and shaders for Switch emulators."
arch=(x86_64)
url="https://github.com/stromcon/emusak-ui"
license=('GPL3')
depends=(expat glib2 nss gtk3)
source=("https://github.com/stromcon/emusak-ui/releases/download/v$pkgver/emusak_${pkgver}_amd64.deb")
sha256sums=('eca3e677642bcc7a8784bf1fa313b590d1b367e3ba8811ac3f28425fe5d24b37')

build(){
	tar -xvf data.tar.xz
}

package() {
	cp -r usr "$pkgdir"
}
