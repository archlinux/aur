# Contributor: K4YT3X <i@k4yt3x.com>
pkgname=chatbox-ce-bin
pkgver=0.10.3
pkgrel=1
pkgdesc='User-friendly Desktop Client App for AI Models/LLMs (GPT, Claude, Gemini, Ollama...) – Community Edition'
arch=('x86_64')
url='https://github.com/Bin-Huang/chatbox'
license=('GPL3')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux' 'libsecret')
provides=('chatbox-ce')
conflicts=('chatbox-ce')
source=("https://github.com/Bin-Huang/chatbox/releases/download/v${pkgver}/Chatbox.CE-${pkgver}-amd64.deb")
b2sums=('fbf60d4d382ac7336a8c0f5f0c3f966cf99e37c79a6ada42ab7c4e54dc4d3601bbbcb1f998430a2a13ce7eaf20b6c2ed6b6245919282932fe34896745ef5aaa8')

package() {
	tar -xvpf data.tar.xz -C $pkgdir
}

