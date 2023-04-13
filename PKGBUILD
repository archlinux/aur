# Maintainer: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>

pkgname="cloud-nuke-bin"
pkgver=0.29.3
pkgrel=1
pkgdesc="A tool for cleaning up your cloud accounts by nuking (deleting) all resources within it."
url="https://github.com/gruntwork-io/cloud-nuke"
arch=('x86_64' 'i386' 'aarch64')
license=('MIT')
provides=('cloud-nuke')
source_x86_64=("$pkgname::$url/releases/download/v${pkgver}/${pkgname/-bin/}_linux_amd64")
source_i386=("$pkgname::$url/releases/download/v${pkgver}/${pkgname/-bin/}_linux_386")
sha256sums_x86_64=(344efb2f3bbc1b0991ebcfe34fa0c995a6f3b78877620a3a655ba54678753635)
sha256sums_i386=(6d75078c342af39e05bff32d7563c948c4794bb39edf013f1cfc917a9ac1b371)
sha256sums_aarch64=(33754c8ad80ade621e7046a4d9ae00dd7c45a2109c80385df2709d61074453d8)

package() {
  install -Dm755 cloud-nuke-bin "$pkgdir/usr/bin/cloud-nuke"
}
