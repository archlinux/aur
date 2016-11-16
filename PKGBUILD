pkgname=glcli
pkgver=0.5
pkgrel=8
pkgdesc="a GitLab CLI for project management"
arch=('x86_64')
url=
license=('GPL')
depends=('wget' 'dpkg' 'sudo')

package() {
  wget https://pkg.celforyon.fr/pool/main/g/glcli/glcli_0.5.8_arch_amd64.deb -O/tmp/glcli_0.5.8_arch_amd64.deb
  sudo dpkg -i /tmp/glcli_0.5.8_arch_amd64.deb
  rm /tmp/glcli_0.5.8_arch_amd64.deb
}
