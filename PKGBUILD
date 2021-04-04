# Maintainer: KoNicks <konicksdev@gmail.com>
pkgname=ms-edge
pkgver=91.0.838.3
pkgrel=1
epoch=
pkgdesc="Microsoft Edge for arch. IMPORTANT: explanation for package duplicate here https://pastebin.com/ybVzVGTW"
arch=('x86_64')
url="https://www.microsoftedgeinsider.com/en-us/download/?platform=linux"
license=('All rights reserved')
groups=()
depends=('gtk3' 'libcups' 'nss' 'alsa-lib' 'libxtst' 'libdrm' 'mesa')
makedepends=()
checkdepends=()
optdepends=('libpipewire02: WebRTC desktop sharing under Wayland'
            'kdialog: for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet'
            'gtk3: for printing'
            'libunity: for download progress on KDE'
            'ttf-liberation: fix fonts for some PDFs - CRBug #369991'
            'xdg-utils')
provides=(ms-edge)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-dev/microsoft-edge-dev_$pkgver-1_amd64.deb")
sha256sums=('cce217648a377fa4cfec41a17c9c17f28da3decb89503202a7167623f789e648')
noextract=()
validpgpkeys=()

package() {
    mkdir $srcdir/pac
    cd $srcdir/pac
    tar xpvf ../data.tar.*
    cp -r * $pkgdir/
}
