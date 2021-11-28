# Maintainer: Jonas Amundsen <jonasba+aur at gmail dot com>

pkgname=cucumber-json-formatter
pkgver=19.0.0
pkgrel=1
pkgdesc="This standalone JSON Formatter provide a language agnostic tool to convert cucumber messages into a JSON document."
arch=("x86_64")
url="https://github.com/cucumber/common/tree/main/json-formatter"
license=("MIT")
source=("https://github.com/cucumber/common/releases/download/json-formatter%2Fgo%2Fv$pkgver/cucumber-json-formatter-linux-amd64")
sha1sums=("fd87d036bd379393262784da5d766e79c935fa03")

package() {
  install -D "$srcdir/cucumber-json-formatter-linux-amd64" "${pkgdir}/usr/bin/cucumber-json-formatter"
}
