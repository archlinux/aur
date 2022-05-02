# Maintainer: mgt <mgt@oi-wiki.org>

pkgname=cxx2flow-gui-bin
_pkgname=cxx2flow-gui
pkgver=0.1.3
pkgrel=1
pkgdesc="GUI for cxx2flow."
arch=('x86_64')
url="https://github.com/Enter-tainer/cxx2flow-gui"
license=('MIT')
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3')
source=("${_pkgname}-${pkgver}-${arch}.deb::https://github.com/Enter-tainer/cxx2flow-gui/releases/download/v${pkgver}/cxx2flow-gui_${pkgver}_amd64.deb")

sha512sums=('de156279072a08009a5e94cd314523972bb634b818e860cfa45edc97f6c0ce92e750bb362e573f106c3280fe3ebe49d11453f89150ec874aeab3ae1ffbf01669')

package() {
	tar xpf data.tar.gz -C ${pkgdir}
}
