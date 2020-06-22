# Maintainer: Ryan Cragun <me@ryan.ec>
pkgname=tomlcheck-bin
pkgver=0.1.0.38
pkgrel=1
pkgdesc="A syntax checker for TOML files"
arch=('x86_64')
url="https://github.com/vmchale/tomlcheck"
license=('BSDv3')
provides=('tomlcheck')
source=("https://github.com/vmchale/tomlcheck/releases/download/${pkgver}/tomlcheck-${arch}-unkown-linux-gnu")
sha256sums=('118d26a04f8e463a21f53ddd7fd0394dadfe2164bb1c686d4f861d92862f2575')
package() {
  install -D -m755 "${srcdir}/tomlcheck-${arch}-unkown-linux-gnu" "${pkgdir}/usr/bin/tomlcheck"
}
