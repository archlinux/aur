# Maintainer: lily wilson <hotaru@thinkindifferent.net>
_pkgbasename=nss
pkgname=lib32-${_pkgbasename}-chacha20
pkgver=3.22
pkgrel=0
pkgdesc="Mozilla Network Security Services with ChaCha20-Poly1305 (32-bit)"
arch=('x86_64')
url="http://www.mozilla.org/projects/security/pki/nss/"
depends=('lib32-nss')
source=(nss.pc.in
        ssl-renegotiate-transitional.patch
        mozilla820740-chacha20.patch)
sha256sums=('b9f1428ca2305bf30b109507ff335fa00bce5a7ce0434b50acd26ad7c47dd5bd'
            '12df04bccbf674db1eef7a519a28987927b5e9c107b1dc386686f05e64f49a97'
            '15c244fc33b8e6647e004b6130fa5c85102e6099b8c5f2b597c817290f0618ab')
