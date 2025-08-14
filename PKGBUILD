# Maintainer: 懵仙兔兔 <acgm@qq.com>
# Maintainer: wearzdk <hi@wearzdk.me>
pkgname=mejituu-wine8
pkgver=8.16_plus_Mejituu_2024012516
pkgrel=1
pkgdesc="wine8 for Wechat (Mejituu version)"
arch=('x86_64')
_arch=amd64
url=https://www.winehq.org/
license=('LGPL-2.1')
depends=(
    alsa-lib                   # libasound2 (>= 1.0.16)
    glibc                       # libc6 (>= 2.26)
    dbus                        # libdbus-1-3 (>= 1.9.16)
    gcc-libs                    # libgcc1 (>= 1:3.0)
    glib2                       # libglib2.0-0 (>= 2.37.3)
    libgphoto2                  # libgphoto2-6 (>= 2.5.10),  libgphoto2-port12 (>= 2.5.10)
    gst-plugins-base            # libgstreamer-plugins-base1.0-0 (>= 1.0.0)
    gstreamer                   # libgstreamer1.0-0 (>= 1.4.0)
    libpulse                    # libpulse0 (>= 0.99.1)
    sane                        # libsane (>= 1.0.24)
    systemd-libs                # libudev1 (>= 183)
    libusb                      # libusb-1.0-0 (>= 2:1.0.21)
    wayland                     # libwayland-client0 (>= 1.11.0)
    libx11                      # libx11-6
    libxext                     # libxext6
    ocl-icd                     # ocl-icd-libopencl1 | libopencl1,  ocl-icd-libopencl1 (>= 1.0) | libopencl-1.2-1
    alsa-plugins                # libasound2-plugins
    ncurses                     # libncurses6 | libncurses5 | libncurses
)

optdepends=(
    libcap                      # libcap2-bin
    cups                        # libcups2
    nss                         # libnss-myhostname
    fontconfig                  # libfontconfig1
    freetype2                    # libfreetype6
    mesa                        # libglu1-mesa | libglu1
    gnutls                      # libgnutls30 | libgnutls28 | libgnutls26
    libjpeg-turbo               # libjpeg62-turbo | libjpeg8
    krb5                        # libgssapi-krb5-2, libkrb5-3
    unixodbc                    # libodbc1
    sdl2                        # libsdl2-2.0-0
    v4l-utils                   # libv4l-0
    libxcomposite               # libxcomposite1
    libxcursor                  # libxcursor1
    libxfixes                   # libxfixes3
    libxi                       # libxi6
    libxinerama                 # libxinerama1
    libxrandr                   # libxrandr2
    libxrender                  # libxrender1
    libxxf86vm                  # libxxf86vm1
)
#_mirror="https://cdn.d.store.deepinos.org.cn"
_mirror="https://d.spark-app.store"		# SDU mirror, sometimes outdated
source=("${_mirror}/store/depends/${pkgname}/${pkgname}_8.16_plus_Mejituu-2024012516_${_arch}.deb")
b2sums=('b02cd03a19a248a12c8527f0cd21d2ed50888a2c8f89aa29323bacaf67aa45a2f1867ac064611a62d76c83f1fe9482dbf33e40bdc7f5b63b31a430d15dc56e1e')

package() {
	cd "${pkgdir}"
	bsdtar -xpvf "${srcdir}/data.tar.xz"
}
