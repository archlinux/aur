# Maintainer: spyophobia <76800505+spyophobia@users.noreply.github.com>

pkgname=simple-tls-bin
_pkgname=simple-tls
pkgver=0.8.0
pkgrel=2
pkgdesc="A simple TLS1.3 tunnel for TCP traffic."
arch=('x86_64' 'aarch64')
url="https://github.com/IrineSistiana/simple-tls"
license=('GPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=(${_pkgname}-${pkgver}.zip::"${url}/releases/download/v${pkgver}/simple-tls-linux-amd64.zip")
source_aarch64=(${_pkgname}-${pkgver}.zip::"${url}/releases/download/v${pkgver}/simple-tls-linux-arm64.zip")
sha512sums_x86_64=('abf4ede2040e201cc2a6513d371949b647715e315b5cf7abc299104df369124a02bd7f345c59cd885b4e330ce6b26f345e1231707fe8c5f83389d950b77e27fc')
sha512sums_aarch64=('aca3c8043a87fda26189ecc69e51a5ac455c1f696432fad31bc3cc8c8ef14e1adbb8f882ef8437024a237cb7214c28a7cc23e25a7cfd3caa1b6ffa2880a7b0fb')

package() {
  cd "$srcdir"
  install -Dm755 simple-tls "${pkgdir}/usr/bin/simple-tls"
}
