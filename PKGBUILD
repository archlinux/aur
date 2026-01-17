pkgbase=prtx-mutator
pkgname=('prtx-mutator-en' 'prtx-mutator-ru')
pkgver=1.0
pkgrel=1
arch=('any')
depends=('bash' 'grub')

source=("prtx-mutator-en"
        "prtx-mutator-ru")
sha256sums=('82def0e02ccf909c35b751c3aa2cc9c7728f75214aa75a4fbcc66dd463d5d567'
            '0b5c6843c2985e07e2a0e0e585230729dba1dfa13e0d0f978768fea589dbb475')

package_prtx-mutator-en() {
    pkgdesc="GRUB themes mutator (English version)"
    provides=('prtx-mutator')
    conflicts=('prtx-mutator-ru')

    install -Dm755 "$srcdir/prtx-mutator-en" "$pkgdir/usr/bin/prtx-mutator"
}

package_prtx-mutator-ru() {
    pkgdesc="GRUB themes mutator (Russian version)"
    provides=('prtx-mutator')
    conflicts=('prtx-mutator-en')

    install -Dm755 "$srcdir/prtx-mutator-ru" "$pkgdir/usr/bin/prtx-mutator"
}
