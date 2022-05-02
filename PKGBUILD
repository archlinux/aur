# Maintainer: mgt <mgt@oi-wiki.org>

pkgname=cxx2flow-gui-bin
_pkgname=cxx2flow-gui
pkgver=0.1.4
pkgrel=1
pkgdesc="GUI for cxx2flow."
arch=('x86_64')
url="https://github.com/Enter-tainer/cxx2flow-gui"
license=('MIT')
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3')
source=("${_pkgname}-${pkgver}-${arch}.deb::https://github.com/Enter-tainer/cxx2flow-gui/releases/download/v${pkgver}/cxx2flow-gui_${pkgver}_amd64.deb")

sha512sums=('06f4d115640a109319ce4bff73ccea1011fd6bd9d4bb824ae4e52879d60ac92d272853d2731b959469132dc94fda46b5a0db225944d21b516b33a3120f370f8b')

package() {
	tar xpf data.tar.gz -C ${pkgdir}
}
