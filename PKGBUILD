pkgname=openssh-gui-bin
pkgver=3.2.0
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

sha256sums=('59cc12771431bf31a3d2086d4f0174f997c62e998070da09e550b0383f41dbd8'
            '19d7c119dcd8aaf1b2bac47325ebf73ac4b32bb3f757e62276a154845be49774'
            '0f53f092ae5b6a8547d016d3c4130c9352fe4af688e0eaaee7c94efdadb78470'
            '04765b5ced4962532281a4c40754d25380df5e89e49bf3f0ea9054f05a6ee34a')
