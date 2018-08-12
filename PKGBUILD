# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=bpfps-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Tool to list and diagnose bpf programs.  (Who watches the watchers..? :)"
arch=('x86_64')
url="https://github.com/genuinetools/bpfps"
license=('MIT')
source=("$url/releases/download/v$pkgver/bpfps-linux-amd64")
sha256sums=('d14a663f6ff80fd27f16231d56916b6c0614a8fefd4e884028113e509b55a532')

package() {
  install -Dm755 "${source##*/}" "${pkgdir}/usr/bin/bpfps"
}
