pkgname=glcli
pkgver=0.5
pkgrel=5
pkgdesc="a GitLab CLI for project management"
arch=('x86_64')
url=
license=('GPL')
depends=('wget' 'dpkg' 'sudo')

package() {
  wget https://pkg.celforyon.fr/arch/glcli_0.5.5_arch_amd64.deb -O/tmp/glcli_0.5.5_arch_amd64.deb
  sudo dpkg -i /tmp/glcli_0.5.5_arch_amd64.deb
  rm /tmp/glcli_0.5.5_arch_amd64.deb
}
