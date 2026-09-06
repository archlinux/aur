# Maintainer: luxcem <a@luxcem.fr>
# Contributor: Jerry Y. Chen <chen@jyny.dev>


pkgname=atlas-bin
pkgdesc="A modern tool for managing database schemas"
pkgver=1.3.0
pkgrel=1
binary=atlas
arch=("x86_64")
makedepends=("go")

license=("Apache-2.0")
provides=('atlas')
conflicts=('atlas')
url="https://github.com/ariga/${binary}"

source_x86_64=("https://release.ariga.io/atlas/${binary}-community-linux-amd64-v${pkgver}")

sha256sums_x86_64=('10d7913e3dce43ab99b8d71534a4cbadaf11a16dc293adf3b91d10e83a0ac70b')
b2sums_x86_64=('10d1dd1fe851becb8e84c206224532dacd1aadeae7ee6a893c118dc223fb3ed0c4ccae740039fef33e3469ed2512b1f979c0c162906cbf4989e0aff6bd06de3b')

package() {
    install -Dm755 "${srcdir}/${binary}-community-linux-amd64-v${pkgver}" "${pkgdir}/usr/bin/${binary}"
}
