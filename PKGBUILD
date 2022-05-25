# Maintainer: bobi

provides=('libproxmox-backup-qemu0')
pkgname="${provides[0]}-bin"
pkgver=1.3.1
pkgrel=1

license=('AGPL')

deb="${provides[0]}_${pkgver}-${pkgrel}_amd64"

source=("http://download.proxmox.com/debian/pve/dists/bullseye/pve-no-subscription/binary-amd64/${deb}.deb")

arch=('x86_64')
sha256sums=('fa47ab3f292ab842ba709f839ed25762986c7bea5324abedc6369e6ac2c10b6e')

package () {
    tar Jxf "${srcdir}"/data.tar.xz -C "${pkgdir}"
}
