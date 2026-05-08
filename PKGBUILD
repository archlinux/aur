# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=1.1.2
pkgrel=1
pkgdesc="CLI for the usectl self-hosted deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('cfbf444613f5e777380ca834abef99a5efe9033a5eb7b9ec79bca07f33342ad6')
sha256sums_aarch64=('38038d31eeb50808ad342d8f769d7461544d7f5c1de582f284ef34e9e48113af')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
