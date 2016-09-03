# Maintainer: Michael Egger <gcarq@archlinux.info>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=inox
pkgver=53.0.2785.89
pkgrel=1
_launcher_ver=3
pkgdesc="Chromium Spin-off to enhance privacy by disabling data transmission to Google"
arch=('i686' 'x86_64')
url="http://www.chromium.org/"
license=('BSD')
depends=('gtk2' 'nss' 'alsa-lib' 'xdg-utils' 'bzip2' 'libevent' 'libxss'
         'libexif' 'libgcrypt' 'ttf-font' 'systemd' 'dbus' 'flac' 'snappy'
         'pciutils' 'libpulse' 'harfbuzz' 'libsecret' 'libvpx'
         'perl' 'perl-file-basedir' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('python2' 'gperf' 'yasm' 'mesa' 'ninja')
makedepends_x86_64=('lib32-gcc-libs' 'lib32-zlib')
optdepends=('kdebase-kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet')
options=('!strip')
install=inox.install
source=(https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$pkgver.tar.xz
        chromium-launcher-$_launcher_ver.tar.gz::https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver.tar.gz
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/inox.desktop
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/chromium-52.0.2743.116-unset-madv_free.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/chromium-widevine.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/disable-autofill-download-manager.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/disable-google-url-tracker.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/disable-default-extensions.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/modify-default-prefs.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/disable-web-resource-service.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/restore-classic-ntp.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/disable-google-ipv6-probes.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/disable-gcm-status-check.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/add-duckduckgo-search-engine.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/branding.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/launcher-branding.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/disable-missing-key-warning.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/disable-translation-lang-fetch.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/disable-update-pings.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/chromium-sandbox-pie.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/disable-new-avatar-menu.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/disable-first-run-behaviour.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/product_logo_{16,22,24,32,48,64,128,256}.png)

sha256sums=('2e3c5f7b12b5b4f150b93004a718fb85778aeddc4df05bbf92b99a19a1c63dee'
            '8b01fb4efe58146279858a754d90b49e5a38c9a0b36a1f84cbb7d12f92b84c28'
            'ff3f939a8757f482c1c5ba35c2c0f01ee80e2a2273c16238370081564350b148'
            '3b3aa9e28f29e6f539ed1c7832e79463b13128863a02e9c6fecd16c30d61c227'
            'd6fdcb922e5a7fbe15759d39ccc8ea4225821c44d98054ce0f23f9d1f00c9808'
            '2d4b600d8085f1d5b3b4f30f8cfc6741558b1c8721dc19dd6b4de2b8dbedd80d'
            'a7329d7f3099f6b8dfe4b7addeb7abbca1cf079139a86c6483a51fed0190478e'
            '6d56f80d8d5977e59551163d06b3ce1fee4efe1e2b2aea07863d6ac853071a63'
            '3a331e004ac84a493dced9a990f71119d3ef31ebbfd67b13a7ec194e835dea11'
            'c2bab92d8d237d341b79d868e814807c3f862d3b3c22a87bbf5e905853e516ae'
            'ed4471fa8a984ccea7fd1900a76865e65a8f5afb6a6390faa22a4758d77bbc07'
            '562eea848542f76537a9f3993bac397b523d0ce419416daf0bb4dd17f5203c7c'
            'b081462f645ffab7aaf2c310761c269329d3d22a36cf463dd0ba5ebb3da2141e'
            '508ae6417ad5dc23581ca593ac19fa36cfdc019d16ac5e159b8cf1e5e1acb551'
            'fe6eddac22aeb0cab1dfcf5932e6d996b7dc3f1a260f55f388a9c397f8cf3d00'
            '8412971b2814c1135375d5e5fc52f0f005ac15ed9e7625db59f7f5297f92727e'
            '55b75daf5aad2a8929c80837f986d4474993f781c0ffa4169e38483b0af6e385'
            '0362593751abc09bbf2244109c93068fc9a40a51ba4dbd17bb2b107ff50d7dce'
            '9e1ce0c47dd51595f13a6f611de39573022c7ff59fc003ab775a5319ebfedad8'
            'cd0d2b665f9d39f7c25929f8e1b85b9a391b4a5a8a70d005cd815bbf2bb4e548'
            '9e37751dca4a2b60681ba14119bc3839685ae420686664de7dfc4245f9eeff3c'
            'c47efe038f502d4fe2b66e59347b01c58ee8739a8d8f050c6c1cc60752d24f13'
            '71471fa4690894420f9e04a2e9a622af620d92ac2714a35f9a4c4e90fa3968dd'
            '4a533acefbbc1567b0d74a1c0903e9179b8c59c1beabe748850795815366e509'
            '7b88830c5e0e9819f514ad68aae885d427541a907e25607e47dee1b0f38975fd'
            '8c10e3b03b13555b461add586422472e0a96d3af49a078d6d952bc0719ba9d94'
            'cc08b771d83b7434c3173c27419bc7d1d4ee375256f3169ef2b9333ba1f2beeb'
            '53a1e8da18069eb4d6ab3af9c923c22a0f020241a4839c3140e3601052ddf6ff'
            '896993987d4ef9f0ac7db454f288117316c2c80ed0b6764019afd760db222dad'
            '3df9b3bbdc07fde63d9e400954dcc6ab6e0e5454f0ef6447570eef0549337354')

# We can't build (P)NaCL on i686 because the toolchain is x86_64 only and the
# instructions on how to build the toolchain from source don't work that well
# (at least not from within the Chromium 39 source tree).
# https://sites.google.com/a/chromium.org/dev/nativeclient/pnacl/building-pnacl-components-for-distribution-packagers
_build_nacl=1
if [[ $CARCH == i686 ]]; then
  _build_nacl=0
fi

prepare() {
  cd "$srcdir/chromium-$pkgver"

  # https://groups.google.com/a/chromium.org/d/topic/chromium-packagers/9JX1N2nf4PU/discussion
  touch chrome/test/data/webui/i18n_process_css_test.html

  # Enable support for the Widevine CDM plugin
  # libwidevinecdm.so is not included, but can be copied over from Chrome
  # (Version string doesn't seem to matter so let's go with "Pinkie Pie")
  sed "s/@WIDEVINE_VERSION@/Pinkie Pie/" ../chromium-widevine.patch |
    patch -Np1

  # Apply Inox patches
  patch -Np1 -i ../disable-autofill-download-manager.patch
  patch -Np1 -i ../disable-google-url-tracker.patch
  patch -Np1 -i ../disable-default-extensions.patch
  patch -Np1 -i ../modify-default-prefs.patch
  patch -Np1 -i ../disable-web-resource-service.patch
  patch -Np1 -i ../restore-classic-ntp.patch
  patch -Np1 -i ../disable-google-ipv6-probes.patch
  patch -Np1 -i ../disable-gcm-status-check.patch
  patch -Np1 -i ../add-duckduckgo-search-engine.patch
  patch -Np1 -i ../branding.patch
  patch -Np1 -i ../disable-missing-key-warning.patch
  patch -Np1 -i ../disable-translation-lang-fetch.patch
  patch -Np1 -i ../disable-update-pings.patch
  patch -Np1 -i ../chromium-sandbox-pie.patch
  patch -Np1 -i ../disable-new-avatar-menu.patch
  patch -Np1 -i ../disable-first-run-behaviour.patch

  # Commentception – use bundled ICU due to build failures (50.0.2661.75)
  # See https://crbug.com/584920 and https://crbug.com/592268
  # ---
  ## Remove bundled ICU; its header files appear to get picked up instead of
  ## the system ones, leading to errors during the final link stage.
  ## https://groups.google.com/a/chromium.org/d/topic/chromium-packagers/BNGvJc08B6Q
  #find third_party/icu -type f \! -regex '.*\.\(gyp\|gypi\|isolate\)' -delete

  # Disable MADV_FREE (if set by glibc)
  # https://bugzilla.redhat.com/show_bug.cgi?id=1361157
  patch -p1 -i "$srcdir"/chromium-52.0.2743.116-unset-madv_free.patch

  # Use Python 2
  find . -name '*.py' -exec sed -i -r 's|/usr/bin/python$|&2|g' {} +
  # There are still a lot of relative calls which need a workaround
  mkdir -p "$srcdir/python2-path"
  ln -sf /usr/bin/python2 "$srcdir/python2-path/python"
  # Download the PNaCL toolchain on x86_64; i686 toolchain is no longer provided
  if (( $_build_nacl )); then
    python2 build/download_nacl_toolchains.py \
      --packages nacl_x86_newlib,pnacl_newlib,pnacl_translator \
      sync --extract
  fi

  # Patch Inox launcher
  cd "$srcdir/chromium-launcher-$_launcher_ver"
  patch -Np1 -i ../launcher-branding.patch
}

build() {
  cd "$srcdir/chromium-launcher-$_launcher_ver"
  make PREFIX=/usr

  cd "$srcdir/chromium-$pkgver"

  export PATH="$srcdir/python2-path:$PATH"

  # CFLAGS are passed through release_extra_cflags below
  export -n CFLAGS CXXFLAGS

  # Work around bug in v8 in which GCC 6 optimizes away null pointer checks
  # https://bugs.chromium.org/p/v8/issues/detail?id=3782
  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69234
  CFLAGS+=' -fno-delete-null-pointer-checks'

  local _chromium_conf=(
    -Dwerror=
    -Dclang=0
    -Dpython_ver=2.7
    -Dlinux_link_gsettings=1
    -Dlinux_link_libpci=1
    -Dlinux_link_pulseaudio=1
    -Dlinux_strip_binary=1
    -Dlinux_use_bundled_binutils=0
    -Dlinux_use_bundled_gold=0
    -Dlinux_use_gold_flags=0
    -Dicu_use_data_file_flag=1
    -Dlogging_like_official_build=1
    -Drelease_extra_cflags="$CFLAGS"
    -Dffmpeg_branding=Chrome
    -Dproprietary_codecs=1
    -Duse_gnome_keyring=0
    -Duse_system_bzip2=1
    -Duse_system_flac=1
    -Duse_system_ffmpeg=0
    -Duse_system_harfbuzz=1
    -Duse_system_icu=0
    -Duse_system_libevent=1
    -Duse_system_libjpeg=1
    -Duse_system_libpng=1
    -Duse_system_libvpx=1
    -Duse_system_libxml=0
    -Duse_system_snappy=1
    -Duse_system_xdg_utils=1
    -Duse_system_yasm=1
    -Duse_system_zlib=0
    -Dusb_ids_path=/usr/share/hwdata/usb.ids
    -Duse_mojo=0
    -Duse_gconf=0
    -Duse_sysroot=0
    -Denable_widevine=1
    -Ddisable_fatal_linker_warnings=1
    -Ddisable_glibc=1
    -Denable_webrtc=0
    -Denable_google_now=0
    -Denable_remoting=0
    -Dsafe_browsing_mode=0
    -Denable_rlz=0
    -Denable_hangout_services_extension=0
    -Dbranding=Chromium
    -Dgoogle_chrome_build=0
    -Denable_web_speech=1
    -Denable_wifi_bootstrapping=0
    -Denable_speech_input=0
    -Denable_pre_sync_backup=0
    -Denable_print_preview=0
    -Dtracing_like_official_build=1
    -Dfieldtrial_testing_like_official_build=1
    -Dfastbuild=1
    )

  if (( ! $_build_nacl )); then
    _chromium_conf+=(
      -Ddisable_nacl=1
      -Ddisable_pnacl=1
    )
  fi

  build/linux/unbundle/replace_gyp_files.py "${_chromium_conf[@]}"
  build/gyp_chromium --depth=. "${_chromium_conf[@]}"

  ninja -C out/Release chrome chrome_sandbox chromedriver
}

package() {
  cd "$srcdir/chromium-launcher-$_launcher_ver"

  make PREFIX=/usr DESTDIR="$pkgdir" install-strip
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.launcher"

  cd "$srcdir/chromium-$pkgver"

  install -D out/Release/chrome "$pkgdir/usr/lib/$pkgname/$pkgname"

  install -Dm4755 out/Release/chrome_sandbox \
    "$pkgdir/usr/lib/$pkgname/chrome-sandbox"

  install -D out/Release/chromedriver "$pkgdir/usr/lib/$pkgname/inoxdriver"

  cp out/Release/{*.pak,*.bin,libwidevinecdmadapter.so} \
    "$pkgdir/usr/lib/$pkgname/"

  # Manually strip binaries so that 'nacl_irt_*.nexe' is left intact
  strip $STRIP_BINARIES "$pkgdir/usr/lib/$pkgname/"{"$pkgname",chrome-sandbox} \
    "$pkgdir/usr/lib/$pkgname/inoxdriver"
  strip $STRIP_SHARED "$pkgdir/usr/lib/$pkgname/libwidevinecdmadapter.so"

  if (( $_build_nacl )); then
    cp out/Release/nacl_helper{,_bootstrap} out/Release/nacl_irt_*.nexe \
      "$pkgdir/usr/lib/$pkgname/"
    strip $STRIP_BINARIES "$pkgdir/usr/lib/$pkgname/"nacl_helper{,_bootstrap}
  fi

  cp -a out/Release/locales "$pkgdir/usr/lib/$pkgname/"

  install -Dm644 out/Release/chrome.1 "$pkgdir/usr/share/man/man1/$pkgname.1"

  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  for size in 16 22 24 32 48 64 128 256; do
    install -Dm644 "$srcdir/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
  done

  ln -s /usr/lib/$pkgname/inoxdriver "$pkgdir/usr/bin/inoxdriver"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 out/Release/icudtl.dat "${pkgdir}/usr/lib/$pkgname/icudtl.dat"
}

# vim:set ts=2 sw=2 et:
