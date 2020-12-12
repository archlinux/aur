# Maintainer: Ivan Vatlin <jenrus+aur at riseup dot net>

pkgname=('i915-vfe-bin')
pkgver=5.9.0
pkgrel=2
url="https://patchwork.freedesktop.org/patch/395580/?series=82783&rev=1"
pkgdesc="Precompiled i915 driver patched to limit VFE threads based on GT"
license=('MIT')
arch=('x86_64')
source=("https://github.com/jeffangelion/i915-vfe/releases/download/${pkgver}/i915.ko.tar.gz")
sha1sums=('ef115397a039a8a4b479ca62fbb3d237af635573')
install=${pkgname}.install

package(){
    install -Dm644 "${srcdir}/i915.ko" \
    "${pkgdir}/usr/lib/modules/$(uname -r)/extramodules/gpu/drm/i915/i915.ko"
}
