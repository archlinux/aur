# Maintainer Alexis Pereda <alexis@pereda.fr>
# Contributor JP-Ellis <josh@jpellis.me>

pkgname=glcli
pkgver=0.5.15
pkgrel=1
pkgdesc="A GitLab CLI for project management"
arch=('i686' 'x86_64')
url=""
license=('GPL')
depends=()
source_x86_64=("https://pkg.celforyon.fr/pool/main/g/glcli/glcli_${pkgver}_arch_amd64.deb")
source_i686=("https://pkg.celforyon.fr/pool/main/g/glcli/glcli_${pkgver}_arch_i386.deb")
md5sums_i686=('035a0935ffa0caa1f6460a911039f824')
md5sums_x86_64=('01f3df0fb131a1fa8cf1c5d2bcb71822')

package() {
    msg2 "Extracting the data.tar.xz..."
    bsdtar -xf data.tar.xz -C "$pkgdir/"
}
