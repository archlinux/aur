# Maintainer: GI_Jack <GI_Jack@hackermail.com>

# Ninja Boot'n'Nuke.
#
# Backported from Ninja OS

pkgname=ninjaos-bootandnuke
pkgver=2.0
pkgrel=1
pkgdesc="Ninja Boot'n'Nuke. Boot'n'Nuke implemented as an initcpio image."
url="https://ninjaos.org/pages/sub-projects/#nban"
arch=('any')
license=('GPL3')
groups=('ninjaos')
depends=('mkinitcpio' 'syslinux' 'parted' 'dosfstools')
install="${pkgname}.install"
replaces=("mkinitcpio-nban")
conflicts=("mkinitcpio-nban")
provides=("mkinitcpio-nban")
source=("https://cdn.projects.ninjaos.org/${pkgname}-${pkgver}.tar.gz"
        "https://cdn.projects.ninjaos.org/${pkgname}-${pkgver}.tar.gz.sig")
sha256sums=('210f02867da2abc510c3b6605885493abed7cefd4e985da730d971ea2db6b794'
            'SKIP')
validpgpkeys=('C65B1F383A46C38A3D3CFDF9C61EC681A148AF51')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cp -ra . "${pkgdir}"
}
