# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>
#
# Copyright Sebastian Wiesner <sebastian@swsnr.de>
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted.
#
# THE SOFTWARE IS PROVIDED “AS IS” AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.

pkgname=networkmanager-defaults-privacy
pkgver=1
pkgrel=1
pkgdesc="Privacy-oriented defaults for Network Manager"
arch=('any')
license=('0BSD')
depends=('networkmanager')
source=(50-networkmanager-defaults-privacy.conf)
sha256sums=('c2245e1539c0152133b3d308bf45d91b8fcb6cd602ed7d8362ec447edec847f7')

package() {
    install -Dm0644 -t "${pkgdir}/usr/lib/NetworkManager/conf.d/" "50-${pkgname}.conf"
}
