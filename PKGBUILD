# Maintainer: Anthony HAMON <hamon.anth@gmail.com>
pkgname=damon
pkgver=0.1.0
pkgrelease=nightly
pkgchecksum=1b882aeddcf6b2af6939c9c7970a7424
pkgrel=2
pkgdesc=" A terminal UI (TUI) for HashiCorp Nomad"
arch=('x86_64')
url="https://github.com/hashicorp/damon"
license=('GPL')
source=("https://github.com/hashicorp/damon/releases/download/nightly/${pkgrelease}/damon_${pkgver}-dev_linux_amd64.zip")
md5sums=($pkgchecksum)

package() {
    unzip -o "damon_${pkgver}-dev_linux_amd64.zip"
    install -Dm755 "damon" "${pkgdir}/usr/bin/${pkgname}"
}
