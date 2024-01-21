# Maintainer: Simon <simon at gamersi dot at>
pkgname='passmantrs-bin'
pkgver='0.1.3'
pkgrel='1'
pkgdesc='PassmanTRS is a password manager that uses Tauri and Rust'
arch=('x86_64')
url='https://github.com/gamersi/passmantrs'
license=('MIT')
depends=('gtk3' 'webkit2gtk')
source=("https://github.com/gamersi/PassmanTRS/releases/download/app-v${pkgver}/passman-trs_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
    tar -xz -f data.tar.gz -C "$pkgdir"
}