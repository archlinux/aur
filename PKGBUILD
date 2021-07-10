# Maintainer: LiveLM <livelm at hotmail dot com> 
# Maintainer: CptSparrow < discordbotdupont at protonmail dot com >
pkgname=emusak-bin
pkgver=1.0.74
pkgrel=1
pkgdesc="Allows you to download saves and shaders for Switch emulators."
arch=(x86_64)
url="https://github.com/stromcon/emusak-ui"
license=('GPL3')
depends=(expat glib2 nss gtk3)
source=("https://github.com/stromcon/emusak-ui/releases/download/v$pkgver/emusak_${pkgver}_amd64.deb")
sha256sums=('a380a5769a5a46de9d25527d039e7addde77c766de3a15241a8e7f7689eb2ba6')

build(){
	tar -xvf data.tar.xz
}

package() {
	cp -r usr "$pkgdir"
}
