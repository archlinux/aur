pkgname=glcli
pkgver=0.5
pkgrel=5
pkgdesc="a GitLab CLI for project management"
arch=('x86_64')
url=
license=('GPL')
depends=('wget' 'dpkg')

package() {
  wget https://pkg.celforyon.fr/pool/main/g/glcli/glcli_0.5.5_amd64.deb -O/tmp/glcli_0.5.5_amd64.deb
  dpkg -i /tmp/glcli_0.5.5_amd64.deb
}
