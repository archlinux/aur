# Maintainer: Charlie <c44014189@gmail.com>
# Maintainer: Your Name <your.email@example.com>
pkgname=framework-laptop-meta
pkgver=1.0.0
pkgrel=1
pkgdesc="Metapackage to install optimal utilities and tweaks for Framework laptops"
arch=('any')
url="https://aur.archlinux.org/packages/framework-laptop-meta"
license=('MIT')

depends=(
    'power-profiles-daemon'  # power management
    'fprintd'                # Fingerprint sensor support
    'brightnessctl'          # Function keys for screen brightness
    'bluez'                  # Bluetooth stack
    'bluez-utils'            # Bluetooth tools
    'fwupd'                  # For framework firmware updates
    'linux-firmware'	     # For WiFi and Bluetooth cards
    'i2c-tools'  	     # To interface with hardware sensor and expansion modules	
)

optdepends=(
	'amd-ucode: Microcode updates for AMD Framework models'
	'intel-ucode: Microcode updates for Intel Framework models'
	'via: For configuring Framework 16 QMK layouts'
)

package() {
    
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
