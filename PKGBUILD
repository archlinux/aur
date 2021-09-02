# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=k0sctl-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="A bootstrapping and management tool for k0s clusters."
arch=('x86_64')
url="https://github.com/k0sproject/k0sctl"
license=('Apache')
source=("https://github.com/k0sproject/k0sctl/releases/download/v${pkgver}/k0sctl-linux-x64")
sha256sums=('ca6743a995426a479e358bcd4940e172dc3ef9353c0ce7ab604bc819adfcbb05')
options=(!strip)

package() {
  install -Dm 755 "$srcdir/k0sctl-linux-x64" "$pkgdir/usr/bin/k0sctl"
}
