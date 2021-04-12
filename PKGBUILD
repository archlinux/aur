# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=k0sctl-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="A bootstrapping and management tool for k0s clusters."
arch=('x86_64')
url="https://github.com/k0sproject/k0sctl"
license=('Apache')
source=("https://github.com/k0sproject/k0sctl/releases/download/v${pkgver}/k0sctl-linux-x64")
sha256sums=('a35edaa7ed74d423d7be45f8d09b3122b57085313a2cc5edfb3603fb0f62b3c3')
options=(!strip)

package() {
  install -Dm 755 "$srcdir/k0sctl-linux-x64" "$pkgdir/usr/bin/k0sctl"
}
