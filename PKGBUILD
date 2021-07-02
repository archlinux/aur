# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=k0sctl-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="A bootstrapping and management tool for k0s clusters."
arch=('x86_64')
url="https://github.com/k0sproject/k0sctl"
license=('Apache')
source=("https://github.com/k0sproject/k0sctl/releases/download/v${pkgver}/k0sctl-linux-x64")
sha256sums=('06385e9e0e5990b94200b0b59776cbc691e92abd92c95be7acfa2bbfd0c1dfbf')
options=(!strip)

package() {
  install -Dm 755 "$srcdir/k0sctl-linux-x64" "$pkgdir/usr/bin/k0sctl"
}
