# $Id$
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Nicola Squartini <tensor5@gmail.com>

_chromiumver=56.0.2924.87
pkgname=electron-wayland
pkgver=1.6.15
pkgrel=1
pkgdesc='Build cross platform desktop apps with web technologies'
arch=('x86_64')
url='http://electron.atom.io/'
license=('MIT' 'custom')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt'
         'libxss' 'minizip' 'nss' 're2' 'snappy')
makedepends=('clang' 'gconf' 'git' 'gperf' 'gtk2' 'harfbuzz-icu' 'jsoncpp'
             'libexif' 'libgnome-keyring' 'libnotify' 'ninja' 'npm' 'pciutils'
             'python2' 'wget' 'yasm')
optdepends=('gvfs: file deletion support (gvfs-trash)'
            'kde-cli-tools: file deletion support (kioclient5)'
            'kdebase-runtime: file deletion support (kioclient)'
            'trash-cli: file deletion support (trash-put)')
provides=('electron')
conflicts=('electron')
source=("git+https://github.com/electron/electron.git#tag=v${pkgver}"
        'git+https://github.com/boto/boto.git'
        'git+https://github.com/electron/brightray.git'
        'breakpad::git+https://github.com/electron/chromium-breakpad.git'
        'git+https://chromium.googlesource.com/chromium/src/tools/grit.git'
        'git+https://github.com/electron/gyp.git'
        "git+https://github.com/electron/libchromiumcontent.git"
        'native_mate::git+https://github.com/zcbenz/native-mate.git'
        'git+https://github.com/electron/node.git'
        'pdf_viewer::git+https://github.com/electron/pdf-viewer.git'
        'git+https://github.com/kennethreitz/requests.git'
        'google-breakpad::git+https://chromium.googlesource.com/breakpad/breakpad/src'
        "electron-chromium-${_chromiumver}.tar.xz::https://github.com/zcbenz/chromium-source-tarball/releases/download/${_chromiumver}/chromium-${_chromiumver}.tar.xz"
        'electron.desktop'
        'default_app-icon.patch'
        'dont-bootstrap-libchromiumcontent.patch'
        'dont-update-submodules.patch'
        'dont-use-sysroot.patch'
        'allow-i686.patch'
        'gtk3-menu-bar.patch'
        'gtk3-message-box.patch'
        'gtk3-warnings.patch'
        'use-system-clang.patch'
        'use-system-libraries-in-node.patch'
        'use-system-ninja.patch'
        'use-system-ffmpeg.patch'
        'breakpad-glibc2.26.patch'
        'brightray-dont-update-submodules.patch'
        'brightray-no-whole-archive.patch'
        'brightray-use-system-ffmpeg.patch'
        'gyp-no-rpath.patch'
        'libchromiumcontent-settings.patch'
        'libchromiumcontent-sort-filenames.patch'
        'libchromiumcontent-static-library-only.patch'
        'libchromiumcontent-use-system-tools.patch'
        'chromium-gtk3.patch'
        'chromium-include-functional.patch'
        'chromium-unset-madv_free.patch'
        'chromium-use-system-ffmpeg.patch'
        'chromium-use-system-minizip.patch'
        'chromium-use-system-re2.patch'
       )
noextract=("chromium-${_chromiumver}.tar.xz")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '70876d8b1e91801af0af133f6de2992c1c8868e34b6354bb060e040958c604d7'
            '5270db01f3f8aaa5137dec275a02caa832b7f2e37942e068cba8d28b3a29df39'
            '84b4c5d9a27727b18e500db4fcc5c44dd52eaeb440eeec02cd8321d1f6bfcadf'
            '14dbd1eecb7034d9e19e1f0c61b0a36ed3b9c610db008ff2a6da2a540ade1221'
            '2a2bc09a40415fd0d57cc8815a158bf32eb4cc2add3b655dddf568c7dc795ff3'
            '182a2eeb784630e6aa3378a54c5709629658eac8e146764008cb2f2214cd5427'
            'c209475c16b506d8d888a54c8564718cf9775f450d1867e19e86a03d99a119be'
            'e18b81d584684657bf0a1af000d22f3c0963250c77ec9d72a4c877eabf032cd2'
            '473f740b2b73cad131a38bd56bfa84e7905378187ef4586ea5eff18342b2ba8a'
            'ea2942e980328ffb989abb32e5aa0991363178b9c455b931ab726e1c3039ec96'
            'ce78850a2d2fe343febee597f0fce361ff99be63f6f720fa844d64efc7abb84e'
            '541d3c11ff4b540f37e066e695cdcc053d069ee09b64dfe170b0fa236b7a1eee'
            'dc3286a1947240ab6ec562263af0b3c9971da2a4ab45970e3e664563e877280f'
            'c697b9bafaa26014fb829001ec783dd74ef35cf1d188cb7729ebf42d73548488'
            '21d9ea4d9bb62450ae1bd82839ec322e542b6b1a2d629f7668e066c94947d47d'
            '3bf045dc4ac1cb32491c4a20de313c3056824e75308f97b9e869fd5a2a166480'
            'cd8e21529ac47c42827c5c619309098c3046fe24106946313e0d0e89d39876fd'
            'e627cbdfa3175d1cdf1bfe17de42bbce5c8086ea7cebf99e1aec251fb5bf8456'
            '68977a78fb41a549eb449dd35f94e0168d647245516397f0ecdfa7a03a147045'
            '6fd3ed318f76c37a0d31ea07c892354718a8c2300f81f1901690f90f8016a04b'
            '4de540ec76736ef3e14475090916a42c03692c542822b430f1ab3f6d36655511'
            '88c924e39de283f698323c9ea5e2e9ce277f2d75b190500a5ad9d3bf81bafdae'
            'a5af00380aa79bebdba5a140ec0ab8722e1c96040562862b033e66d09f2eefc2'
            '8fbaa725f7e8ba3851d84d7b03f7837049f8ce2e976fa1ebc76231236678183b'
            '43116692892bb85646ebf34ce91d47233203e9c9fa887d6993ecbbb5033dcd27'
            'ccba3002243fb1f9a67c8a60af310706caa591d12aef45f1d0f4bda47626f3ab'
            'ed9fdb6a66a6ff7e4726d273d9da68fa68117d8f6668781005ec1d621759a5be'
            '76fb05484a4e9faaad0763b65b6ad84224a9f74aff9227c7a3dc1c15eea324c4'
            'b9fcfa7f25f0b49dd44e13b86e5f160e1e73cef0af5227840a4c2d2329e092c9'
           )

_system_libs=('ffmpeg'
              'flac'
              'harfbuzz-ng'
#              'icu'
              'libevent'
              'libjpeg'
              'libpng'
              'libvpx'
              'libwebp'
              'libxml'
              'libxslt'
              're2'
              'snappy'
              'yasm'
              'zlib'
             )

prepare() {
  cd "${srcdir}"/electron

  patch -Np1 -i "${srcdir}"/default_app-icon.patch  # Icon from .desktop file
  patch -Np1 -i "${srcdir}"/gtk3-menu-bar.patch
  patch -Np1 -i "${srcdir}"/gtk3-message-box.patch
  patch -Np1 -i "${srcdir}"/gtk3-warnings.patch
  patch -Np1 -i "${srcdir}"/use-system-clang.patch
  patch -Np1 -i "${srcdir}"/use-system-libraries-in-node.patch
  patch -Np1 -i "${srcdir}"/use-system-ninja.patch
  patch -Np1 -i "${srcdir}"/use-system-ffmpeg.patch
  patch -Np1 -i "${srcdir}"/dont-update-submodules.patch
  patch -Np1 -i "${srcdir}"/dont-use-sysroot.patch
  patch -Np1 -i "${srcdir}"/dont-bootstrap-libchromiumcontent.patch
  patch -Np1 -i "${srcdir}"/allow-i686.patch

  mkdir -p "${srcdir}"/python2-path
  ln -sf /usr/bin/python2 "${srcdir}/python2-path/python"

  for m in boto breakpad brightray native_mate node pdf_viewer requests; do
    git submodule init vendor/${m}
    git config submodule.vendor/${m}.url "${srcdir}/${m}"
  done
  git submodule update

  cd "${srcdir}"/electron/vendor/pdf_viewer
  git submodule init vendor/grit
  git config submodule.vendor/grit.url "${srcdir}/grit"
  git submodule update

  cd "${srcdir}"/electron/vendor/breakpad
  git submodule init src
  git config submodule.src.url "${srcdir}"/google-breakpad
  git submodule update
  patch -Np1 -i "${srcdir}"/breakpad-glibc2.26.patch

  cd "${srcdir}"/electron/vendor/brightray
  patch -Np1 -i "${srcdir}"/brightray-dont-update-submodules.patch
  patch -Np1 -i "${srcdir}"/brightray-use-system-ffmpeg.patch
  patch -Np1 -i "${srcdir}"/brightray-no-whole-archive.patch
  for m in libchromiumcontent gyp; do
    git submodule init vendor/${m}
    git config submodule.vendor/${m}.url "${srcdir}/${m}"
  done
  git submodule update
  # Add extra libraries for unbundling
  sed -e "s/'-lexpat',/'-lexpat', '<\!@(pkg-config --libs-only-l libavcodec libavformat libavutil libevent flac harfbuzz-icu jsoncpp minizip libpng libpulse vpx libwebpdemux libxml-2.0 libxslt)', '-ljpeg', '-lre2', '-lsnappy', '-latomic',/" \
      -e 's/gtk+-2\.0/gtk+-3.0/' \
      -i brightray.gyp

  cd "${srcdir}"/electron/vendor/brightray/vendor/gyp
  # Remove a useless $ORIGIN/lib/ rpath from the electron binary
  patch -Np1 -i "${srcdir}"/gyp-no-rpath.patch

  cd "${srcdir}"/electron/vendor/brightray/vendor/libchromiumcontent
  git checkout 19ca886975716c02d6de9fd41b8297a4e1774be2
  git submodule update --init vendor/python-patch
  patch -Np1 -i "${srcdir}"/libchromiumcontent-settings.patch
  patch -Np1 -i "${srcdir}"/libchromiumcontent-sort-filenames.patch  # deterministic build
  patch -Np1 -i "${srcdir}"/libchromiumcontent-use-system-tools.patch
  patch -Np1 -i "${srcdir}"/libchromiumcontent-static-library-only.patch
  rm patches/third_party/ffmpeg/build_gn.patch  # Use system ffmpeg
  ln -s "${srcdir}"/chromium-${_chromiumver} src
  if [ ! -e src/.version ]; then
    echo "${_chromiumver}" > src/.version
  fi
  cd src
  patch -Np1 -i "${srcdir}"/chromium-gtk3.patch
  patch -Np1 -i "${srcdir}"/chromium-include-functional.patch
  patch -Np1 -i "${srcdir}"/chromium-unset-madv_free.patch  # fixes crash with kernels < 4.5
  patch -Np1 -i "${srcdir}"/chromium-use-system-ffmpeg.patch
  patch -Np1 -i "${srcdir}"/chromium-use-system-minizip.patch
  patch -Np1 -i "${srcdir}"/chromium-use-system-re2.patch

  for lib in "${_system_libs[@]}" libjpeg_turbo; do
      find -type f -path "*third_party/${lib}/*" \
          \! -path "*third_party/${lib}/chromium/*" \
          \! -path "*third_party/${lib}/google/*" \
          \! -path "*base/third_party/icu/*" \
          \! -path "*base/third_party/libevent/*" \
          \! -regex '.*\.\(gn\|gni\|isolate\|py\)' \
          -delete
  done
  python2 build/linux/unbundle/replace_gn_files.py --system-libraries "${_system_libs[@]}"
}

build() {
  export PATH="${srcdir}/python2-path:${PATH}"

  if [ "${CARCH}" == 'x86_64' ]; then
    _target=x64
  else
    _target=ia32
  fi

  # Build GN
  cd "${srcdir}/chromium-${_chromiumver}"
  gn_flags=(
    'clang_base_path="/usr"'
    'clang_use_chrome_plugins=false'
    'treat_warnings_as_errors=false'
    'use_sysroot=false'
  )
  python2 tools/gn/bootstrap/bootstrap.py --gn-gen-args "${gn_flags[*]}"
  # libevent not needed anymore
  find -type f -path "*base/third_party/libevent/*" \
    \! -regex '.*\.\(gn\|gni\|isolate\|py\)' \
    -delete

  cd "${srcdir}"/electron
  LDFLAGS="${LDFLAGS} -Wl,-z,noexecstack"
  script/bootstrap.py --verbose \
                      --target_arch=${_target} \
                      --clang_dir=/usr \
                      --build_libchromiumcontent
  script/build.py -c Release
}

package() {
  cd "${srcdir}"/electron

  _cc="${srcdir}"/electron/vendor/brightray/vendor/libchromiumcontent/dist/main

  install -d -m755 "${pkgdir}"/usr/share/licenses/electron
  install -m644 LICENSE "${_cc}"/LICENSES.chromium.html \
          "${pkgdir}"/usr/share/licenses/electron
  for lib in brightray native_mate node; do
    install -m644 vendor/${lib}/LICENSE \
            "${pkgdir}"/usr/share/licenses/electron/LICENSE-${lib}
  done
  install -m644 vendor/brightray/vendor/libchromiumcontent/src/LICENSE \
          "${pkgdir}"/usr/share/licenses/electron/LICENSE-chromium

  cd out/R
  install -d -m755 "${pkgdir}"/usr/lib/electron
  install -m644 blink_image_resources_200_percent.pak \
          content_resources_200_percent.pak content_shell.pak icudtl.dat \
          natives_blob.bin \
          pdf_viewer_resources.pak \
          snapshot_blob.bin \
          ui_resources_200_percent.pak \
          views_resources_200_percent.pak \
          "${pkgdir}"/usr/lib/electron
  install -m755 electron "${pkgdir}"/usr/lib/electron
  install -dm755 "${pkgdir}"/usr/bin
  ln -s ../lib/electron/electron "${pkgdir}"/usr/bin
  # namcap warning: Referenced library 'libnode.so' is an uninstalled dependency
  # Fixable by moving libnode.so to /usr/lib
  install -m644 libnode.so "${pkgdir}"/usr/lib/electron
  cp -r locales resources "${pkgdir}"/usr/lib/electron
  cd ../..

  echo -n "v${pkgver}" > "${pkgdir}"/usr/lib/electron/version

  # Install .desktop and icon file
  install -Dm644 "${srcdir}"/electron.desktop \
          "${pkgdir}"/usr/share/applications/electron.desktop
  install -Dm644 default_app/icon.png \
          "${pkgdir}"/usr/share/pixmaps/electron.png  # hicolor has no 1024x1024

  # Install Node headers
  _headers_dest="${pkgdir}/usr/lib/electron/node"
  install -d -m755 "${_headers_dest}"
  cd "${srcdir}"/electron/vendor/node
  find src deps/http_parser deps/zlib deps/uv deps/npm \
    -name "*.gypi" \
      -exec install -D -m644 '{}' "${_headers_dest}/{}" \; \
    -or -name "*.h" \
      -exec install -D -m644 '{}' "${_headers_dest}/{}" \;
  install -m644 {common,config}.gypi "${_headers_dest}"
  cd "${_cc}"/src
  find v8 -name "*.h" \
    -exec install -D -m644 '{}' "${_headers_dest}/deps/{}" \;
  # echo '9' > "${_headers_dest}/installVersion"
}
