# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ssh-vault-bin
pkgver=0.12.6
pkgrel=2
provides=('ssh-vault')
pkgdesc="Encrypt/Decrypt using SSH keys"
arch=('x86_64')
url='https://ssh-vault.com'
license=('BSD')
source=("${pkgname}-${pkgver}.tar.gz::https://dl.bintray.com/nbari/ssh-vault/ssh-vault_${pkgver}_linux_amd64.tar.gz")
sha256sums=('d24579b48f551c5d498268c3dde9fa8ed26d37f23bf4fcf87a8811452acce6e8')

package() {
  install -Dm755 "${srcdir}/ssh-vault_${pkgver}_linux_amd64"/ssh-vault "${pkgdir}/usr/bin/ssh-vault"
  install -Dm644 "${srcdir}/ssh-vault_${pkgver}_linux_amd64"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}