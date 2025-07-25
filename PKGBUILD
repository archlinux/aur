# Maintainer: Dominik Bühler <dom.buehler@outlook.com>
pkgname=switchtube-downloader
pkgver=0.1.0
pkgrel=1
pkgdesc="A lightweight CLI to download SwitchTube videos"
arch=('x86_64' 'aarch64')
url="https://github.com/domi413/SwitchTube-Downloader"
license=('MIT')
source_x86_64=("$pkgname-v$pkgver-linux-amd64.zip::https://github.com/domi413/SwitchTube-Downloader/releases/download/v$pkgver/switchtube-downloader_linux_amd64.zip")
source_aarch64=("$pkgname-v$pkgver-linux-arm64.zip::https://github.com/domi413/SwitchTube-Downloader/releases/download/v$pkgver/switchtube-downloader_linux_arm64.zip")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    # Install the binary, license, and documentation
    install -Dm755 "switchtube-downloader" -t "$pkgdir/usr/bin"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
