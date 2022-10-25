# Maintainer: Anthony HAMON <hamon.anth@gmail.com>
pkgname=damon
pkgver=0.1.0
pkgrelease=nightly
pkgchecksum=d34d177dc9e73b4585908b184b1fe48d
pkgrel=1
pkgdesc=" A terminal UI (TUI) for HashiCorp Nomad"
arch=('x86_64')
url="https://github.com/hashicorp/damon"
license=('GPL')
source=("https://github.com/hashicorp/damon/releases/download/${pkgrelease}/damon_${pkgver}-dev_linux_amd64.zip")
md5sums=($pkgchecksum)

package() {
    unzip -o "damon_${pkgver}-dev_linux_amd64.zip"
    install -Dm755 "damon" "${pkgdir}/usr/bin/${pkgname}"
}
