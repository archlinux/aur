# Contributor: yaroslav <proninyaroslav@mail.ru>
# Contributor: Nathan Owe. <ndowens04+AUR@gmail.com>

pkgname=createvm
pkgver=0.5
pkgrel=2
pkgdesc="Script to create VMware virtual machine"
arch=('i686' 'x86_64')
url="https://github.com/beeman/createvm.sh"
license=('GPL2')
depends=('bash' 'zip' 'vmware-workstation')
source=("https://github.com/beeman/createvm.sh/archive/${pkgver}.tar.gz")
sha256sums=('40ae752a19483be5e67c0adce3c8a269eb215ffaaad6251e37097ab2f087193c')

package() {
    cd ${srcdir}/${pkgname}.sh-${pkgver}

    install -d ${pkgdir}/usr/bin
    install -m755 createvm.sh ${pkgdir}/usr/bin/createvm
}
