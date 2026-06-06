pkgname=linktui-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A TUI for managing WiFi, Bluetooth and VPN connections on Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/austinemk/linktui"
license=('MIT')
depends=('networkmanager' 'bluez')
provides=('linktui')
conflicts=('linktui' 'linktui-git')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/austinemk/linktui/releases/download/v${pkgver}/linktui_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/austinemk/linktui/releases/download/v${pkgver}/linktui_linux_arm64.tar.gz")

sha256sums_x86_64=('49a0948e9e2798d553e78506181266c1334699e9a8e0482a5a8a04fd19f539a5')
sha256sums_aarch64=('44b705b0db8433bb0f7ddb1e5f82b90c7d1d191ab778fcf727a89e23b1ee02d9')

package() {
    install -Dm755 linktui "$pkgdir/usr/bin/linktui"
}
