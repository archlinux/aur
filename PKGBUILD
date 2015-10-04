# Maintainer: Luca Contini <jkd[dot]luca[at]gmail[dot]com>

# If you do not trust the source of installation, you can navigate to
# https://sites.google.com/site/davidtv/ and download from there.
# The MD5 sum provided is for pac-4.5.5.5-all.deb [Sep 2, 215]

pkgname=pacmanager-bin
pkgver=4.5.5.5
pkgrel=1
arch=('any')
license=('GPL3')

pkgdesc="Perl Auto Connector PAC Manager"
url="https://sites.google.com/site/davidtv/"

depends=('perl-crypt-blowfish' 'perl-gnome2-vte' 'perl-expect' 'perl-crypt-rijndael' 'perl-gtk2-ex-simple-list' 'perl-io-stty' 'perl-io-tty' 'perl-net-arp' 'uuid')
source=("https://contini.info/files/pac-${pkgver}-all.deb")
md5sums=('68da89f89e3faaf8c70288a675828164')


package() {
    tar -C "${pkgdir}" -xvJf "${srcdir}/data.tar.xz"
}
