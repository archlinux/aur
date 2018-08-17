# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=git-bug-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Distributed bug tracker embedded in Git"
arch=('x86_64' 'i686')
url='https://github.com/MichaelMure/git-bug'
license=('GPLv3')
source_x86_64=("$url/releases/download/$pkgver/git-bug_linux_amd64")
sha256sums_x86_64=('5d85c2b9f54fd2cbc119bbb7bf9f597bd7648a8608c53b58e93da43f1c1e55c9')
source_i686=("$url/releases/download/$pkgver/git-bug_linux_386")
sha256sums_i686=('5d85c2b9f54fd2cbc119bbb7bf9f597bd7648a8608c53b58e93da43f1c1e55c9')

package() {
  local source=source_$CARCH
  install -Dm755 "${!source##*/}" "${pkgdir}/usr/bin/git-bug"
}
