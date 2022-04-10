# Maintainer: LiveLM <livelm at hotmail dot com>
# Maintainer: CptSparrow < discordbotdupont at protonmail dot com >
pkgname=emusak-bin
pkgver=2.1.4
pkgrel=1
pkgdesc="Allows you to download saves and shaders for Switch emulators."
arch=(x86_64)
url="https://github.com/stromcon/emusak-ui"
license=('GPL3')
depends=(expat glib2 nss gtk3)
source=("https://github.com/stromcon/emusak-ui/releases/download/v$pkgver/emusak_${pkgver}_amd64.deb")
sha256sums=('fcac7a2066febe2aa3f97d7f46fc9b0e480f1ee9e3b7b94ee0d8c317f5885f08')

build(){
	tar -xvf data.tar.xz
}

package() {
	cp -r usr "$pkgdir"
}
