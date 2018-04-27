# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=bpfps-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Tool to list and diagnose bpf programs.  (Who watches the watchers..? :)"
arch=('x86_64')
url="https://github.com/genuinetools/bpfps"
license=('MIT')
source=("$url/releases/download/v$pkgver/bpfps-linux-amd64")
sha256sums=('70319ee158a7ea6f9b53cf1b4dff5b8e41b948eccb6cbcad41c8262de6869e99')

package() {
  install -Dm755 "${source##*/}" "${pkgdir}/usr/bin/bpfps"
}
