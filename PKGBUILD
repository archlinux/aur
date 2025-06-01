# Maintainer: nabbisen <nabbisen@scqr.net>
pkgname=forskscope
pkgver=0.22.3
pkgrel=1
pkgdesc="Diff and merge GUI tool with cross-platform support build with Tauri: Rust and Svelte (Pre-built binary)"
arch=('x86_64')
url="https://github.com/forskscope/forskscope"
license=('BSD-2-Clause')
depends=('webkit2gtk' 'gtk3' 'libappindicator-gtk3')
source=("${pkgname}@Linux-x64-gnu-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${pkgname}@Linux-x64-gnu-${pkgver}.tar.gz")
sha256sums=('a2b81d47a7cacd0d3438201bd9cd9e1861c65214b3e38b3331e57a3ea0ad33d5')

package() {
  tar -xf "${srcdir}/${pkgname}@Linux-x64-gnu-${pkgver}.tar.gz" -C "${srcdir}"

  install -Dm755 "${srcdir}/${pkgname}@Linux-x64-gnu-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
