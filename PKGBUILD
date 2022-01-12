# Maintainer: Jonatan Bravo <zephrax@gmail.com>
pkgname=envconsul-0.12.1
pkgver=0.12.1
pkgrel=1
epoch=
pkgdesc="Launch a subprocess with environment variables using data from @HashiCorp Consul and Vault."
arch=("x86_64")
url="https://github.com/hashicorp/envconsul"
license=('MPL-2.0')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=("envconsul")
source=("https://releases.hashicorp.com/envconsul/${pkgver}/envconsul_${pkgver}_linux_amd64.zip")
sha256sums=("361628aada03816d25ff13f4a0938953beda57f3a4ccd60e4278343762b95f6a")
validpgpkeys=()

package() {
    pkgname=envconsul
    cd "${srcdir}/"
    mkdir -p "${pkgdir}/usr/local/bin"
    install -m755 "${pkgname}" "${pkgdir}/usr/local/bin/${pkgname}"
    chmod +x ${pkgdir}/usr/local/bin/${pkgname}
}
