pkgname=absolutely_unsuspicious_package_with_a_very_unassuming_name_that_doesnt_catch_anyones_eye
pkgver=1.0.0
pkgrel=1
pkgdesc="A dummy package for a CTF forensics task. Please don't report it, I'll remove it after the event ends."
arch=('any')
license=('GPL')

package() {
    install -d "$pkgdir/tmp"

    cat << 'EOF' > "$pkgdir/tmp/flag.txt"
p4ckm4n_Syu_br0k3_my_5y573m_4g41n
EOF
}
