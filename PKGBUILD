# Maintainer: Joaquim Madureira <joaquimmadureira at protonmail dot com>
pkgname=warewoolf-bin
pkgver=3.1.1
pkgrel=1
pkgdesc="A novel-writing system/rich text editor designed to be usable without a mouse."
arch=('x86_64')
url="https://github.com/brsloan/warewoolf"
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libdrm' 'libxcb' 'trash-cli')
source=("https://github.com/brsloan/warewoolf/releases/download/v${pkgver}/warewoolf_${pkgver}_amd64.deb")
sha256sums=('e26891be8b654a137b71abb104de4efcfcf75af384d9e8a10d1de3cdbf000ee0')

package() {
    tar -xf data.tar.xz -C "${pkgdir}"
    chmod 755 -R "${pkgdir}"
}
