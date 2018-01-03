# Maintainer: Andre Vaillancourt <g.andre.vaillancourt@gmail.com>
# Contributor: Thomas Weischuh <thomas t-8ch de>

pkgname=ubuntu-keyring
pkgver=2016.10.27
pkgrel=1
pkgdesc="GnuPG keys of the Ubuntu archive"
arch=('any')
url="http://mirrors.kernel.org/ubuntu/pool/main/u/ubuntu-keyring"
license=('GPL')
depends=('gnupg')

source=("http://mirrors.kernel.org/ubuntu/pool/main/u/ubuntu-keyring/ubuntu-keyring_${pkgver}_all.deb")

package() {
  tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}

sha256sums=('7ce0bcf0bf09fd9263960e89f4fa93ce51ca1a525ec367d62975af96fdd3e6a2')
