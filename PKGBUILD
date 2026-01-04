# Maintainer: Piotrek2713 <piotrek.karasinski13@gmail.com>
pkgname=ca-racing
pkgver=0.2.0
pkgrel=1
pkgdesc="Top-down 2D racing game written in Python"
arch=('x86_64')
url="https://github.com/piotrek1372/ca-racing"
license=('MIT')
depends=('glibc') # PyInstaller bundles most things, but glibc is system-level
options=('!strip') # Don't strip PyInstaller binaries, it can break them
source=("https://github.com/piotrek1372/ca-racing/releases/tag/v${pkgver}-${pkgrel}/ca-racing_linux_amd64")
sha256sums=('4cf21c9f30b9b6b0b7d90b00b472861ec80d701f3ad20190aff5f266a2de00c7')

package() {
    install -Dm755 "ca-racing_linux_amd64" "$pkgdir/usr/bin/ca-racing"
    
    # Opcjonalnie: instalacja ikony i pliku .desktop
    # install -Dm644 "icon.png" "$pkgdir/usr/share/pixmaps/ca-racing.png"
}
