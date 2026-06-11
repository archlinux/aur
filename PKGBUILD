pkgname=openssh-gui-bin
pkgver=
pkgrel=1
pkgdesc="A GUI for OpenSSH configuration and management (Binary version)"
arch=('x86_64')
url="https://github.com/frequency403/OpenSSH-GUI"
license=('MIT')

depends=('icu' 'openssl' 'zlib' 'krb5' 'libx11')
options=('!strip')

provides=('openssh-gui')
conflicts=('openssh-gui' 'openssh-gui-git' 'openssh-gui-nightly')

source=(
  "openssh-gui::https://github.com/frequency403/OpenSSH-GUI/releases/download/v${pkgver}/OpenSSH-GUI-linux-x64"
  "openssh-gui-icon::https://github.com/frequency403/OpenSSH-GUI/releases/download/v${pkgver}/appicon.png"
  "openssh-gui-desktop::https://github.com/frequency403/OpenSSH-GUI/releases/download/v${pkgver}/io.github.frequency403.openssh_gui.desktop"
  "LICENSE::https://raw.githubusercontent.com/frequency403/OpenSSH-GUI/v${pkgver}/LICENSE"
)

sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')