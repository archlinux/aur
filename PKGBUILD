pkgname=boot-repair-andres
pkgver=0.1.0
pkgrel=1
pkgdesc="Swiss-army live rescue tool: GRUB repair, display reset, initramfs, kernel, system update, boot freedom, diagnostics."
arch=('any')
license=('MIT')
depends=('bash' 'git')
makedepends=('git')
source=("git+https://github.com/AndresDev859674/boot-repair.git")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/boot-repair/boot-repair.sh" \
        "$pkgdir/usr/bin/boot-repair"
}
