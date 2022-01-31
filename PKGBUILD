# Maintainer: LiveLM <livelm at hotmail dot com>
# Maintainer: CptSparrow < discordbotdupont at protonmail dot com >
pkgname=emusak-bin
pkgver=1.0.109
pkgrel=1
pkgdesc="Allows you to download saves and shaders for Switch emulators."
arch=(x86_64)
url="https://github.com/stromcon/emusak-ui"
license=('GPL3')
depends=(expat glib2 nss gtk3)
source=("https://github.com/stromcon/emusak-ui/releases/download/v$pkgver/emusak_${pkgver}_amd64.deb")
sha256sums=('02129a7e5c15b47a1b7be9b5896c92ac1b730c2a8515ca3dd7299a65d05a572f')

build(){
	tar -xvf data.tar.xz
}

package() {
	cp -r usr "$pkgdir"
}
