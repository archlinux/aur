# Contributor: K4YT3X <i@k4yt3x.com>
pkgname=chatbox-ce-bin
pkgver=0.10.2
pkgrel=1
pkgdesc='User-friendly Desktop Client App for AI Models/LLMs (GPT, Claude, Gemini, Ollama...)'
arch=('x86_64')
url='https://github.com/Bin-Huang/chatbox'
license=('GPL3')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux' 'libsecret')
provides=('chatbox-ce')
conflicts=('chatbox' 'chatbox-ce')
source=("https://github.com/Bin-Huang/chatbox/releases/download/v${pkgver}/Chatbox.CE-${pkgver}-amd64.deb")
b2sums=('620175d06fae9f0a6ec93cc2fd9a586d9ca4b644787df0c1676e4aa1062d8c67aa0d4097cb624c37fdb63ef466084eca1f85a3367c3f31088c441c32717c8141')

package() {
	tar -xvpf data.tar.xz -C $pkgdir
}

