# Maintainer: mgt <mgt@oi-wiki.org>

pkgname=cxx2flow-gui-bin
_pkgname=cxx2flow-gui
pkgver=0.1.5
pkgrel=1
pkgdesc="GUI for cxx2flow."
arch=('x86_64')
url="https://github.com/Enter-tainer/cxx2flow-gui"
license=('MIT')
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3')
source=("${_pkgname}-${pkgver}-${arch}.deb::https://github.com/Enter-tainer/cxx2flow-gui/releases/download/v${pkgver}/cxx2flow-gui_${pkgver}_amd64.deb")

sha512sums=('ad7afd13d42d9be69220b0cc4edaa6c9f51cc32b40713012f54fe85d9a372c319f11ffdb85f1e9591eb0d3dbee55884dc9a8c0bf329dfe7058f1c9c9407b6f8d')

package() {
	tar xpf data.tar.gz -C ${pkgdir}
}
