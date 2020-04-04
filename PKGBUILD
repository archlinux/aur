# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ssh-vault-bin
pkgver=0.12.6
pkgrel=2
provides=('ssh-vault')
pkgdesc="Encrypt/Decrypt using ssh keys"
arch=('x86_64')
url='https://ssh-vault.com'
license=('BSD-3-Clause')
source=("https://dl.bintray.com/nbari/ssh-vault/ssh-vault_${pkgver}_linux_amd64.tar.gz")
md5sums=('1c1987f9b6034d86256fb193d34c05de')

package() {
	install -Dm755 "${srcdir}/ssh-vault_${pkgver}_linux_amd64"/ssh-vault "${pkgdir}/usr/bin/ssh-vault"
	install -Dm644 "${srcdir}/ssh-vault_${pkgver}_linux_amd64"/LICENSE "${pkgdir}/usr/share/licenses/ssh-vault/LICENSE"
}