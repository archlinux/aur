# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="matlab-runtime-meta"
pkgname=(
  "${pkgbase}"
  "java-${pkgbase}"
)
pkgver=R2025b
pkgrel=2
pkgdesc="A high-level language for numerical computation and visualization"
arch=('any')
url="https://www.mathworks.com/products/compiler/matlab-runtime.html"
license=('custom:None')

package_matlab-runtime-meta() {
  pkgdesc+=" (runtime, meta)"
  depends=(
    # https://github.com/mathworks-ref-arch/container-images/tree/main/matlab-runtime-deps
    # Arch                  # Debian
    'alsa-lib'              # libasound2t64
    'ca-certificates'       # ca-certificates
    # 'cairo'               # libcairo-gobject2
    #                       # libcairo2
    'fontconfig'            # libfontconfig1
    # 'fribidi'             # libfribidi0
    'gcc-libs'              # libatomic1
    'gdk-pixbuf2'           # libgdk-pixbuf-2.0-0
    'glib2'                 # libglib2.0-0t64
    'glibc'                 # libc6
    'gst-plugins-base-libs' # gstreamer1.0-plugins-base
                            # libgstreamer-plugins-base1.0-0
    'gst-plugins-good'      # gstreamer1.0-plugins-good
    'gstreamer'             # gstreamer1.0-tools
                            # libgstreamer1.0-0
    # 'gtk2'                # libgtk2.0-0t64
    # 'gtk3'                # libgtk-3-0t64
    # 'libcap'              # libcap2
    # 'libcups'             # libcups2t64
    'libdrm'                # libdrm2
    'libgl'                 # libgl1
    'libice'                # libice6
    # 'libltdl'             # libltdl7
    # 'libprocps'           # procps
    'libsndfile'            # libsndfile1
    # 'libtirpc'            # libtirpc3t64
    'libxcomposite'         # libxcomposite1
    # 'libxcursor'          # libxcursor1
    # 'libxdamage'          # libxdamage1
    'libxfixes'             # libxfixes3
    # 'libxfont2'           # libxfont2
    'libxft'                # libxft2
    # 'libxinerama'         # libxinerama1
    'libxrandr'             # libxrandr2
    'libxt'                 # libxt6t64
    # 'libxtst'             # libxtst6
    'libxxf86vm'            # libxxf86vm1
    'mesa'                  # libgbm1
    # 'net-tools'           # net-tools
    'nettle'                # libnettle8t64
    'nspr'                  # libnspr4
    'nss'                   # libnss3
    'pam'                   # libpam0g
    'pango'                 # libpango-1.0-0
                            # libpangocairo-1.0-0
                            # libpangoft2-1.0-0
    'pixman'                # libpixman-1-0
    'unzip'                 # unzip
    'util-linux-libs'       # libuuid1
    'wayland'               # libwayland-client0
    # 'xorg-setxkbmap'      # x11-xkb-utils
    # 'xorg-xkbcomp'
    # 'xorg-xkbevd'
    # 'xorg-xkbprint'
    # 'xorg-xkbutils'
    'zlib'                  # zlib1g
  )
  optdepends=(
    "java-${pkgbase}: supported system-wide JDK"

    # https://www.mathworks.com/support/requirements/supported-compilers-linux.html
    'gcc8: supported C/C++ compiler'
    'gcc9: supported C/C++ compiler'
    'gcc10: supported C/C++ compiler'
    'gcc11: supported C/C++ compiler'
    'gcc12: supported C/C++ compiler'
    'gcc13: supported C/C++ compiler'
    'gcc10-fortran: supported Fortran compiler'

    'cairo: listed in the original depends as libcairo-gobject2, libcairo2'
    'fribidi: listed in the original depends as libfribidi0'
    'gtk2: listed in the original depends as libgtk2.0-0t64'
    'gtk3: listed in the original depends as libgtk-3-0t64'
    'libcap: listed in the original depends as libcap2'
    'libcups: listed in the original depends as libcups2t64'
    'libltdl: listed in the original depends as libltdl7'
    'libprocps: listed in the original depends as procps'
    'libtirpc: listed in the original depends as libtirpc3t64'
    'libxcursor: listed in the original depends as libxcursor1'
    'libxdamage: listed in the original depends as libxdamage1'
    'libxfont2: listed in the original depends as libxfont2'
    'libxinerama: listed in the original depends as libxinerama1'
    'libxtst: listed in the original depends as libxtst6'
    'net-tools: listed in the original depends as net-tools'
    'xorg-setxkbmap: listed in the original depends as x11-xkb-utils'
    'xorg-xkbcomp: listed in the original depends as x11-xkb-utils'
    'xorg-xkbevd: listed in the original depends as x11-xkb-utils'
    'xorg-xkbprint: listed in the original depends as x11-xkb-utils'
    'xorg-xkbutils: listed in the original depends as x11-xkb-utils'
  )
}

package_java-matlab-runtime-meta() {
  pkgdesc+=" (Java components, runtime, meta)"
  depends=(
    # https://www.mathworks.com/support/requirements/openjdk.html
    'java-environment<=21'
    'java-environment>=8'
  )
}
