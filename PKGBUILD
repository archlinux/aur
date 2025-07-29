# Maintainer: nabbisen <nabbisen@scqr.net>
pkgname=forskscope
pkgver=0.22.5
pkgrel=1
pkgdesc="Diff and merge GUI tool with cross-platform support build with Tauri: Rust and Svelte (Pre-built binary)"
arch=('x86_64')
url="https://github.com/forskscope/forskscope"
license=('BSD-2-Clause')
depends=('webkit2gtk' 'gtk3' 'libappindicator-gtk3')
source=("${pkgname}@Linux-x64-gnu-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${pkgname}@Linux-x64-gnu-${pkgver}.tar.gz")
sha256sums=('40bbe199f683f1d4ef35962cfa0648c1db8a6c5698cb8a3e7149452c617ebd84')

package() {
  tar -xf "${srcdir}/${pkgname}@Linux-x64-gnu-${pkgver}.tar.gz" -C "${srcdir}"

  install -Dm755 "${srcdir}/${pkgname}@Linux-x64-gnu-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
