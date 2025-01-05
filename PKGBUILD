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
pkgver=2
pkgrel=1
pkgdesc="Privacy-oriented defaults for Network Manager"
arch=('any')
license=('0BSD')
depends=('networkmanager')
source=(50-networkmanager-defaults-privacy.conf)
sha256sums=('af00bac1330e06d9b11ca1b2fcabb2bd23cf1d9fff4b57b3893e1ea65af42af7')

package() {
    install -Dm0644 -t "${pkgdir}/usr/lib/NetworkManager/conf.d/" "50-${pkgname}.conf"
}
