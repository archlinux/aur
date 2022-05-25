# Maintainer: bobi

provides=('libproxmox-backup-qemu0-dev')
pkgname="${provides[0]}-bin"
pkgver=1.3.1
pkgrel=1

license=('AGPL')

deb="${provides[0]}_${pkgver}-${pkgrel}_amd64"

source=("http://download.proxmox.com/debian/pve/dists/bullseye/pve-no-subscription/binary-amd64/${deb}.deb")

depends=('libproxmox-backup-qemu0')

arch=('x86_64')
sha256sums=('1669cbf148037f4728620a1eed60ef09149b493515ae2e0fa7d1250cdbcd2721')

package () {
    tar Jxf "${srcdir}"/data.tar.xz -C "${pkgdir}"
}
