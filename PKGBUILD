# Maintainer: pacmanics
pkgname=psx2eboot
pkgver=1.0.0
pkgrel=1
pkgdesc="GUI batch converter for PlayStation BIN/CUE images to PSP EBOOT.PBP files"
arch=('any')
url="https://aur.archlinux.org/packages/psx2eboot"
license=('GPL-3.0-only')
depends=('python' 'tk' 'podman' 'git')
source=('psx2eboot.py' 'psx2eboot.desktop' 'psx2eboot.svg' 'LICENSE')
sha256sums=('04e5792e994b45aa4d32441df7bb7e1027b7b4ac6d782ca03770dd98d7be0eb6'
            '426ba6b2c1fc685b4a76131e264a6b91cf6cddeba52cd3d8fa5f95959e616cae'
            '69343fddd978a115528e510f54f0e65bc6ea3cd23601ed96ea672bae489c447f'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
  install -Dm755 "$srcdir/psx2eboot.py" "$pkgdir/usr/bin/psx2eboot"
  install -Dm644 "$srcdir/psx2eboot.desktop" "$pkgdir/usr/share/applications/psx2eboot.desktop"
  install -Dm644 "$srcdir/psx2eboot.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/psx2eboot.svg"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
