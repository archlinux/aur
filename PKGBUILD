# Maintainer: Amaan Hashmi-Ubhi <amaanhub at protonmail dot com>

pkgname=ovhcloud-cli-bin
_pkgname=ovhcloud
pkgver=0.12.0
pkgrel=1
pkgdesc="ovhcloud is a single, unified command‑line interface for managing OVHCloud"
arch=('x86_64')
url="https://github.com/ovh/ovhcloud-cli"
license=('Apache-2.0')
source=("$url/releases/download/v$pkgver/ovhcloud-cli_Linux_x86_64.tar.gz")
sha512sums=('848a758bbd5fad744c0eee74c4a573edbb923016ad669627d22bb3196e4cd42be35ac50db7e833a2f7cf27e576ea9c85aef49c0837ccb453cf24c0ec5539f013')

package(){
	install -Dm755 "$srcdir"/"$_pkgname" "$pkgdir"/usr/bin/"$_pkgname"
}
