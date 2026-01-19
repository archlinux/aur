# Maintainer: Yang Mingtian <i@skylee.xyz>
pkgname=vampire-bin
pkgver=5.0.1
pkgrel=3
pkgdesc='A theorem prover for first-order logic'
arch=('x86_64')
url='https://vprover.github.io/'
license=('custom:Vampire Software Licence Agreement')
source=("${pkgname}-${pkgver}.zip::https://github.com/vprover/vampire/releases/download/v${pkgver}/vampire-Linux-X64.zip")
sha256sums=('6ff2f42ea7fb9753ee104efc3e623d5e39443190f7c82a63e1e1517bf9d2cde3')

package() {
	install -D "vampire" -t "${pkgdir}/usr/bin/"
}
