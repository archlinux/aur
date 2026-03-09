# Maintainer: Fikri Muhammad Iqbal <fikri.miqbal23@gmail.com>

pkgname=nui-bin
pkgver=0.9.2
pkgrel=1
pkgdesc="Free and Open Source NATS management GUI."
arch=('x86_64')
url="https://natsnui.app/"
license=('Unlicense')

depends=(
  webkit2gtk-4.1
  gtk3
)

source=(
  "https://github.com/nats-nui/nui/releases/download/v${pkgver}/linux-amd64-gtk40-nui-app"
  "nui.desktop"
  "appicon.png"
)

sha256sums=(
  "987abf8f211b20bd9ad13de49aa31d2647db9cd202cd8ccac7f6f19589c4e4e8"
  "07066302a59c1497d0d52fcafcf340b3d48f481a52c1e06a84fa328bc2945118"
  "d6ad5ba8a51b0e180a39b1e2e7bb8c3fb6fca11859b11b8dbc68090d88440824"
)

package() {
  install -Dm755 "$srcdir/linux-amd64-gtk40-nui-app" "$pkgdir/usr/bin/nui"
  install -Dm644 "$srcdir/nui.desktop" "$pkgdir/usr/share/applications/nui.desktop"
  install -Dm644 "$srcdir/appicon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/nui.png"
}
