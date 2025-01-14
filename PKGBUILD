# Contributor: K4YT3X <i@k4yt3x.com>
pkgname=chatbox-ce-bin
pkgver=0.10.4
pkgrel=1
pkgdesc='User-friendly Desktop Client App for AI Models/LLMs (GPT, Claude, Gemini, Ollama...) – Community Edition'
arch=('x86_64')
url='https://github.com/Bin-Huang/chatbox'
license=('GPL3')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux' 'libsecret')
provides=('chatbox-ce')
conflicts=('chatbox-ce')
source=("https://github.com/Bin-Huang/chatbox/releases/download/v${pkgver}/Chatbox.CE-${pkgver}-amd64.deb")
b2sums=('50e2165f72f091eeb5d0fa8e62af963a40ed94fd220e37233626997e0a2beee118e088c954cbfdb0ed96803e902dccaae5002f0925724fe5534cde60ed5dc144')

package() {
	tar -xvpf data.tar.xz -C $pkgdir
}

