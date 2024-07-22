# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=google-chat-tauri-bin
pkgver=0.0.8
pkgrel=1
pkgdesc="Google Chat client for Linux based on Tauri"
arch=('x86_64' 'aarch64')
url="https://github.com/ThatOneCalculator/google-chat-tauri/"
license=('MIT')
depends=(glib2 hicolor-icon-theme gtk3 webkit2gtk)

source_x86_64=(
	"https://github.com/ThatOneCalculator/google-chat-tauri/releases/download/app-v${pkgver}/google-chat_${pkgver}_amd64.deb"
)

source_aarch64=(
	"https://github.com/ThatOneCalculator/google-chat-tauri/releases/download/app-v${pkgver}/Google.Chat_${pkgver}_aarch64.deb"
)

sha256sums_x86_64=(
	'5d19f0631e1693516f09539c602f1574ca1ffeac111f8599e5f7e8f1fc92931c'
)

sha256sums_aarch64=(
	'602c68d157635f62ece7355bff73fca170a8ae43704e6531d49b0edbb7913804'
)

package() {
  echo "Extracting the data.tar.gz..."
  bsdtar -xf data.tar.gz -C "$pkgdir/"
}
