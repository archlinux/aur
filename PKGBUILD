# Maintainer: Francis Fajardo <fajardo@duck.com>

pkgname=ilspy-bin
pkgver=11.2.0.10050
_tag=v11.2
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
sha256sums_x86_64=('f37ab2809f3e62ae47986b3c5a976fcea48826f8c48e5521a907f43e53b987de')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir/"
}
