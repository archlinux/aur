# Maintainer: Ismo Toijala <ismo.toijala@gmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sébastien Luttringer
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

_pkgbase=rxvt-unicode
pkgname=(rxvt-unicode-fontspacing-noinc-vteclear-secondarywheel)
pkgver=9.31
pkgrel=11
arch=(x86_64)
url='https://software.schmorp.de/pkg/rxvt-unicode.html'
license=(GPL-3.0-only)
makedepends=(
  libxft
  libxt
  libxext
  libxmu
  perl
  startup-notification
  libnsl
  libptytty
  signify
)
# seems that pacman's hardcoded to attempt gpg verification if source array contains a *.sig file
source=("$_pkgbase-$pkgver.tar.bz2::https://dist.schmorp.de/rxvt-unicode/$_pkgbase-$pkgver.tar.bz2"
        "$_pkgbase-$pkgver.tar.bz2.signature::https://dist.schmorp.de/rxvt-unicode/$_pkgbase-$pkgver.tar.bz2.sig"
        signing-key.pub
        perl-5.38.patch
        urxvt-lerp.patch
        font-width-fix.patch
        line-spacing-fix.patch
        popup-menu-hang.diff
        noinc.diff
        clear.patch
        secondaryWheel.patch
        starttop.patch
        urxvt.desktop
        urxvtc.desktop
        urxvt-osc.patch)
sha512sums=('4d14ecbbb62de1b1c717277f5aae5cfb536e11392f2d4b82c884c1713f437fce8e9dd69a328fa353a55d068d8ee4121a31900f45191acec172d5dc76652b6255'
            '389b1959387f4d5c960901763e45cdcf670fb8de6506ed9d1d49b3c58616f1fb10d5b158b5f89257f3db1bac3a0b270bb35043e7e13e5222549153e83db79ef9'
            'a09a434387e22612a9225ddfa444044977712c6410efe8a77a33d8aa607bd1acbef2a1da08b62e21a4b070f0974ba94ae907ac0452b5d060e33a1c051a7780e4'
            'e7361bd9ad5199d1976e9b0d4d8d74b1e18ae795ef255f42633c7be2632382aa94b30e5790ee788ee51fbd8bf0af9092d896d69684f362a8a507523ad4653473'
            'd46307c09c1a0fa7958f4b02bd1a61fe72fe1ea711505f2eea2ac20e7a95187c0b0d1dd33dabcc47070d242fb99b42998c3686afd653de27cecab6edb78a4616'
            '0336281f46e1fe0d8ce4abe7a9cd2de0d406c62afc9e63846526c72f88565e9bed9a97339104bb2d51af21fa11631dfdd6319f4c67b50514637c618f5dd85292'
            'a38be68512070af71245ac599611ef7eb91bdd4b6a405c651e2ad2260784dff5e20d57025e51b440814b1b9269322ef1cda45a482e6efe5c8e2ca8fdd6e883fa'
            '0121b398cba3848834583516324a16b4fb7623e5ab52235dbbdf711b1abd27fc4ec3ad4c55b97e802ccba827012151bf224a255e45c269cc5ff4957170f7223b'
            '4c991305093aa54ae20548fd7618606e2c149be7fb22259c402c807e6ff8522dbb69fb36e9ad2d823bdde25eb1917e93869d0996701bc132bd325874f9006577'
            'e9c031fd1d999fdd259270d501ad26ff3e4916ad75088192ebd5a5a1a72b5162987041e29f48f5a3804b8c2a5d699dc6536d7eeb78a544dd154b3fb600b5c205'
            'cb9bb0cf0f9b1f7006d7f49db7ca9b36003139015af8c8dca2aa60afd20a1b50dd2c098bb54f53fc82fa0b793463cb22b0ce54e9aadc22cf162bec6923de4cfe'
            '8e3356149026cdd1d889251eb2764603fc67791e8ac3e4665b6215b2e5a788d2d213b9c2eacdb4c274a4d051276bbd0e4d03984b59c413df8bc3461c019d155b'
            '7184714a908071a4e8e5c065c5f90255e94dfd072df459c8d6f66fca3647781b3d1f6908b9303bcfd0d5b3f2e3822a8d66efaaa8a7c4d44f6e682839031a6e99'
            'aa501eeeb220ba03b3f101b160230612efbca87694fef88c469b2976d29769c24b34576ea82f6c7941fad6039ac776f32e397add9b957b49bf2e84aeb67b66d6'
            'ed6a799e0031f554f402de0683e39731d620c7448e369d2b6cb03fe4e9b02e4f3a955524a57b63ab5c25b4980a08f09a5582583d15119460dfdce5a1b0c0d291')
b2sums=('439a8c33b7260e0f2fd68b8a4409773c06c3bb7623b5dfbbb0742cc198c9fd25e8a247907878639db5fac3dcd3b6be3d839347787bcf08ca602ae246607f750b'
        '1c58b1d53c72dbfae4f9302f5903365f84e85b2a1e9846d9dd9c712a7900e73a94621a41bee6dd75d690df8ae95d1d987d93ca4355eb8d8c423c57680df0edcf'
        '6d6bd90b77e67ccb876f0c78c710c9e1b82767a19aeadaac9310e5628b791586fc8475ad5179eaa2fee386ae80aae916226167ec92c5af309bba4052238326c8'
        '407ff86d4840023df7e765a6748873233c59b2b33c6374a463e3e59176a92ff439eeb4a49c2a33ce812e29880e9bc76ce3c16f2818f1ef4632a3a5dcd986f275'
        'bcc799195262fed196229c446eee0740f9f42ffe4429dabdfe0ce5ae2cdeb71f6a93998135973338f56811cf64562c759c34e35bda84901cf159f86b4a01ac64'
        '0ebdac7c5d0d1acbba6be2b2b874283cfd28480bc339b8e24ca49effd8addb3b8e817da0922e09715140f9f23b33d0304bf21b923ac332e0f546f8b83bf65df2'
        '5525a6c79177d84bcd37ebed4fcf2a90b83466ed1bf5daac5ff678795f53cd0c70674420ef3371d1223cc37d98f95100f59f071a8de70ccc5d920a3009ed1a1a'
        '8b4b666b2d0f2c05df7cf2011a3dfbbea63ee341377eebb6269a5ecf35c33c9c957ef509985a69cca92683c8f7e2ba405bb55178612c78c0fb30697ea40bc799'
        '99252cb833399eb48a74cd5c4b18dd52f5ee41cd0988928ce700ee6ce31de91fdf0f009c2fbc584eab183cea2ead011480a3f228099cad11ee504e7db8acdb50'
        '55dcd12e0af94bd67fa5d0ae099bc9cba1c972565c37d05a34a5185f8d0507ac7a5ffb2b8e8073c8d675ddbbd52c518bc4cdc0ccf53d64249d9c53fd51f63ac4'
        'ea6ea0cac2fbdfc450fe57a48b0871edd58d62aa8912a7de5d30a0c90f60b0b6c1d4680963bb1e3532516012562f6f1a55c1b967d57eb9fdc46e14a8536fab11'
        '23ab4e926fe2adee69b9be77a3f0623edd04806a4625d3517d1a0e96e708b764e081605f125fd15c92b6e335ca9fbb3ca6288a5180baf1c480c3bf894ba36b3f'
        '79a5f759dc6568c9193d3c533ba6c649aafef7eb545abf5a87cdf8d877ce2c25ae4a841e23967cc63f8048eb140343f0fe1a8327642410190c5da60415c50d3c'
        '420a8820c165a2137cf9936acdc597ec696a5d75c30f8bbcfb0f3b75d04fdf4a9a4e3ae38a35372cfbf0497b2d115902aa18b2b38d292cf881fc19d1c113b7df'
        'a3d5933026ce980c0f2a1b12844d0ddd3ad48217fee4a730659c580a1cf06ed73260e574549ff6d64f726c06f2135f7bc9146066c887a1b961e75028360cdc6a')

prepare() {
  # hacking around to validate with signify
  mv -v "$_pkgbase-$pkgver.tar.bz2."{signature,sig}
  signify -V -p "signing-key.pub" -m "$_pkgbase-$pkgver.tar.bz2"

  # Locale fix for perl 5.38
  patch -d $_pkgbase-$pkgver -p1 < perl-5.38.patch

  # Fix lerp() error with C++20 / GCC16
  patch -d $_pkgbase-$pkgver -p1 < urxvt-lerp.patch

  # Fix OSC with 7-bit ST.
  patch -d $_pkgbase-$pkgver -p1 < urxvt-osc.patch

  patch -d $_pkgbase-$pkgver -p0 < font-width-fix.patch
  patch -d $_pkgbase-$pkgver -p0 < line-spacing-fix.patch
  patch -d $_pkgbase-$pkgver -p0 < popup-menu-hang.diff
  patch -d $_pkgbase-$pkgver -p1 < noinc.diff
  patch -d $_pkgbase-$pkgver -p1 < clear.patch
  patch -d $_pkgbase-$pkgver -p1 < secondaryWheel.patch
  # https://bugs.archlinux.org/task/77062
  patch -d $_pkgbase-$pkgver -p1 < starttop.patch
}

build() {
  cd ${_pkgbase}-${pkgver}

  # With >=GCC-16 memsets before constructor invocation are optimized away.
  # Together with LTO this breaks internal assumptions about object initialization,
  # leading to segfaults.
  # Disable those optimizations. 
  export CXXFLAGS+=" -fno-lifetime-dse"

  # we disable smart-resize (FS#34807)
  # do not specify --with-terminfo (FS#46424)
  # do not specify --disable-frills (FS#77474)
  # workaround ncurses --disable-root-access (FS#79143)
  local configure_options=(
    --prefix=/usr
    --enable-256-color
    --enable-combining
    --enable-fading
    --enable-font-styles
    --enable-iso14755
    --enable-keepscrolling
    --enable-lastlog
    --enable-mousewheel
    --enable-next-scroll
    --enable-perl
    --enable-pointer-blank
    --enable-rxvt-scroll
    --enable-selectionscrolling
    --enable-slipwheeling
    --disable-smart-resize
    --enable-startup-notification
    --enable-transparency
    --enable-unicode3
    --enable-utmp
    --enable-wtmp
    --enable-xft
    --enable-xim
    --enable-xterm-scroll
    --disable-pixbuf
  )
  
  export TIC="/usr/bin/tic -o${srcdir}/terminfo"

  ./configure "${configure_options[@]}"

  make
}

package() {
  pkgdesc='Unicode enabled rxvt-clone terminal emulator (urxvt)'
  depends=(
    rxvt-unicode-terminfo
    libxft
    perl
    startup-notification
    libnsl
    libptytty
    libxext
    libxmu
  )
  provides=($_pkgbase)

  # install freedesktop menu
  install -vDm644 -t "$pkgdir/usr/share/applications" urxvt{,c}.desktop

  cd "$_pkgbase-$pkgver"

  make DESTDIR="$pkgdir" install
}

# vim: ts=2 sw=2 et:
