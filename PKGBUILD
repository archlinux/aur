# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=bpfps-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="Tool to list and diagnose bpf programs.  (Who watches the watchers..? :)"
arch=('x86_64')
url="https://github.com/genuinetools/bpfps"
license=('MIT')
source=("$url/releases/download/v$pkgver/bpfps-linux-amd64")
sha256sums=('4859f0a3c14d61651a473a4c225066c298fdf3bb219acc5e037aaebf268eb807')

package() {
  install -Dm755 "${source##*/}" "${pkgdir}/usr/bin/bpfps"
}
