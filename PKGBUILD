# Maintainer: Francis Fajardo <fajardo@duck.com>

pkgname=ilspy-bin
pkgver=11.1.0.9782
_tag=v11.1
pkgrel=1
pkgdesc=".NET Decompiler with support for PDB generation, ReadyToRun, Metadata (&more)"
arch=('x86_64')
url="https://github.com/icsharpcode/ILSpy"
license=('MIT')
depends=('dotnet-runtime-10.0' 'fontconfig' 'libx11')
provides=('ilspy')
conflicts=('ilspy' 'ilspy-git')
options=('!strip' '!debug')
source_x86_64=("${url}/releases/download/${_tag}/ilspy_${pkgver}-1_amd64.deb")
sha256sums_x86_64=('726696d5a62146daf627d06d255fa3c18253f633b8615f48b31382ae88ef5141')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
