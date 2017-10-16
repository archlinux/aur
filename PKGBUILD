# Maintainer: Ian Beringer <ian@ianberinger.com>

pkgname=kube-prompt
pkgver=1.0.3
pkgrel=1
license=('MIT')
pkgdesc='An interactive kubernetes client featuring auto-complete using go-prompt'
arch=("i686" "x86_64")
url='https://github.com/c-bata/kube-prompt'
source_i686=("$url/releases/download/v$pkgver/${pkgname}_v${pkgver}_linux_386.zip")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname}_v${pkgver}_linux_amd64.zip")
sha256sums_i686=('ed7797845388a79e3641f6fc39bad097a263b7ff49a4143ce154955a58c67f1e')
sha256sums_x86_64=('af99e9fd2ff7ec240d63f1ae0cf1b7331a294d76a7d28fdc5c540b0ebabb779e')
provides=("$pkgname")

package() {
  install -Dm755 "./${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
