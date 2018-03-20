# Maintainer: Paul Wilk <paul.wilk@null.net>

pkgname=open-vm-tools-dkms
epoch=6
pkgver=10.2.0
_pkgsubver=g2911709
pkgrel=4
pkgdesc='Open Virtual Machine Tools kernel modules (DKMS)'
arch=('i686' 'x86_64')
url='https://github.com/vmware/open-vm-tools'
license=('GPL2')
conflicts=('open-vm-tools-modules' 'vmware-modules-dkms')

depends=('dkms')
options=('!strip')
optdepends=('open-vm-tools: Open Virtual Machine Tools'
            'linux-headers: Header files for Linux kernel')
install=open-vm-tools-dkms.install

_name='open-vm-tools'
_dirname='stable-10.2.x'
_version="${pkgver}-${_pkgsubver}"
_full_name="vmware-open-vm-tools-2911709"
_dkms_version='2015.01.29'

source=(https://github.com/vmware/open-vm-tools/tarball/${pkgver}-0-${_pkgsubver}
        dkms.conf.in)
sha256sums=('433eef7333e394d85c8c3c5c799e5943c88c0cfbc4384cfde856f08fc3fa15e7'
            '5255a183cccd80b2bfbbf519b1cc8cec81ae40bbc0b5a88dfddd95532ece84ed')
