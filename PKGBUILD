# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=k0sctl-bin
pkgver=0.12.6
pkgrel=1
pkgdesc="A bootstrapping and management tool for k0s clusters."
arch=('x86_64')
url="https://github.com/k0sproject/k0sctl"
license=('Apache')
source=("k0sctl-linux-x64-$pkgver::https://github.com/k0sproject/k0sctl/releases/download/v${pkgver}/k0sctl-linux-x64")
sha256sums=('5e5e810f47457c0f35cb8d89d684d8854b6b12922be927118a16e5f7ae1ecdae')
options=(!strip)

package() {
  install -Dm 755 "$srcdir/k0sctl-linux-x64-$pkgver" "$pkgdir/usr/bin/k0sctl"
}
