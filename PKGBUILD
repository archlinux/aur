# Maintainer: TypeMonky Contributors

pkgname=typemonky-bin
pkgver=0.1.0.alpha.2_202603071958
pkgrel=1
pkgdesc="Offline touch typing trainer (prebuilt binary, GTK4, Wayland-friendly)"
arch=('x86_64')
url="https://github.com/Levantado/typemonky"
license=('MIT')
depends=('gtk4' 'libadwaita' 'sqlite')
provides=('typemonky')
conflicts=('typemonky' 'typemonky-git')
source=("typemonky-v0.1.0-alpha.2+202603071958-linux-x86_64.tar.gz::https://github.com/Levantado/typemonky/releases/download/v0.1.0-alpha.2+202603071958/typemonky-v0.1.0-alpha.2+202603071958-linux-x86_64.tar.gz")
sha256sums=('e3d539057bb485f1b5e6ac308714ea018e486c7f9db55e03c390a1178be6c49a')

package() {
  cd "${srcdir}"
  install -Dm755 typemonky-linux/typemonky "${pkgdir}/usr/bin/typemonky"
  install -Dm644 typemonky-linux/io.typemonky.typemonky.desktop "${pkgdir}/usr/share/applications/io.typemonky.typemonky.desktop"
  install -Dm644 typemonky-linux/io.typemonky.typemonky.metainfo.xml "${pkgdir}/usr/share/metainfo/io.typemonky.typemonky.metainfo.xml"
  install -Dm644 typemonky-linux/io.typemonky.typemonky.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.typemonky.typemonky.svg"
}
