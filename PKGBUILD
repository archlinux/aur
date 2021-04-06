# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>

pkgname=gitrob-bin
_pkgname=${pkgname%-bin}
pkgver=3.4.1_beta
pkgrel=1
url='https://github.com/codeEmitter/gitrob'
pkgdesc='Reconnaissance tool for GitLab and GitHub organizations'
arch=(x86_64)
license=("MIT")
provides=($_pkgname)
conflicts=($_pkgname)
source=("${url}/releases/download/v${pkgver//_/-}/${_pkgname}_linux_amd64_${pkgver//_/-}.zip")
sha256sums=('03e65fea2a120e8b9c4c6d9ccbdda38c998bb627acc98e59d8294886b1b20728')
sha512sums=('bf8983e5c23902098bd0ef7a375f6200bd952ab87e121f8427dba03e0cc5d6b1f3001de5aa6378ed56fa53f24f1b4bb7f382bde13a222baf2e22ba147d7cb036')
b2sums=('70cb5393ed9b64d272937dab5a5bb9f94227a6b54a683cb87ddc46a3319c202c72365dde97dab98bb8a7ead3ac70efa538a4977e23ee0a571a8c3640f26b1a57')

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
