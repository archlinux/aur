# Maintainer: Anthony HAMON <hamon.anth@gmail.com>
pkgname=damon
pkgver=0.1.0
pkgrelease=nightly
pkgchecksum=2fc8e60f0bed25e1e2fa45d8bbce35fd
pkgrel=3
pkgdesc=" A terminal UI (TUI) for HashiCorp Nomad"
arch=('x86_64')
url="https://github.com/hashicorp/damon"
license=('Mozilla Public License 2.0')
source=("https://github.com/hashicorp/damon/releases/download/${pkgrelease}/damon_${pkgver}-dev_linux_amd64.zip")
md5sums=($pkgchecksum)

package() {
    unzip -o "damon_${pkgver}-dev_linux_amd64.zip"
    install -Dm755 "damon" "${pkgdir}/usr/bin/${pkgname}"
}
