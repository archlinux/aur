err() {
    ALL_OFF="\e[1;0m"
    BOLD="\e[1;1m"
    RED="${BOLD}\e[1;31m"
	local mesg=$1; shift
	printf "${RED}==>${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@" >&2
}

msg() {
    ALL_OFF="\e[1;0m"
    BOLD="\e[1;1m"
    GREEN="${BOLD}\e[1;32m"
	local mesg=$1; shift
	printf "${GREEN}==>${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@" >&2
}

post_install() {
post_upgrade
}

post_upgrade() {

	if [[ "$(pacman -Qq | grep 'pacman-mirrors' -m1)" == "pacman-mirrors" ]]; then
		msg "replacing pacman-mirrors with regular reflector ..."
		pacman -Rdd --noconfirm pacman-mirrors
		pacman -U --noconfirm https://ger.mirror.pkgbuild.com/community/os/x86_64/reflector-2020.3.21.2-1-any.pkg.tar.zst
		reflector --sort age --save /etc/pacman.d/mirrorlist
		rm $(pacman-conf DBPath)db.lck &> /dev/null
		pacman --noconfirm -Syy
		fi

	if [[ "$(pacman -Qq | grep 'linux54' -m1)" == "linux54" ]]; then
		msg "replacing linux54 with regular linux-lts ..."
		pacman -Rdd --noconfirm linux54
		pacman -Rdd --noconfirm linux54-headers
		pacman -S --noconfirm linux-lts linux-lts-headers
	fi
	
		if [[ "$(pacman -Qq | grep 'linux54-nvidia-440xx' -m1)" == "linux54-nvidia-440xx" ]]; then
		pacman -Rdd --noconfirm linux54-nvidia-440xx
		pacman -S --noconfirm nvidia-dkms
    fi

	if [[ "$(pacman -Qq | grep 'linux54-bbswitch' -m1)" == "linux54-bbswitch" ]]; then
		pacman -Rdd --noconfirm linux54-bbswitch
		pacman -S --noconfirm bbswitch-dkms
    fi
    
    if [[ "$(pacman -Qq | grep 'linux54-acpi_call' -m1)" == "linux54-acpi_call" ]]; then
		pacman -Rdd --noconfirm linux54-acpi_call
		pacman -S --noconfirm acpi_call-dkms
    fi
    
    if [[ "$(pacman -Qq | grep 'linux54-broadcom-wl' -m1)" == "linux54-broadcom-wl" ]]; then
		pacman -Rdd --noconfirm linux54-broadcom-wl
		pacman -S --noconfirm broadcom-wl-dkms
    fi
    if [[ "$(pacman -Qq | grep 'linux54-r8168' -m1)" == "linux54-r8168" ]]; then
		pacman -Rdd --noconfirm linux54-r8168
    fi
    
    if [[ "$(pacman -Qq | grep 'linux54-virtualbox-host-modules' -m1)" == "linux54-virtualbox-host-modules" ]]; then
		pacman -Rdd --noconfirm linux54-virtualbox-host-modules
		pacman -S --noconfirm virtualbox-host-dkms
    fi
    
    if [[ "$(pacman -Qq | grep 'linux54-virtualbox-guest-modules' -m1)" == "linux54-virtualbox-guest-modules" ]]; then
		pacman -Rdd --noconfirm linux54-virtualbox-guest-modules
		pacman -S --noconfirm virtualbox-guest-dkms
    fi

	if [[ "$(pacman -Qq | grep 'linux419' -m1)" == "linux419" ]]; then
		msg "replacing linux419 with regular linux-lts ..."
		pacman -Rdd --noconfirm linux419
		pacman -Rdd --noconfirm linux419-headers
		pacman -S --noconfirm linux-lts linux-lts-headers
	fi

		if [[ "$(pacman -Qq | grep 'linux419-nvidia-440xx' -m1)" == "linux419-nvidia-440xx" ]]; then
		pacman -Rdd --noconfirm linux419-nvidia-440xx
		pacman -S --noconfirm nvidia-dkms
    fi

	if [[ "$(pacman -Qq | grep 'linux419-bbswitch' -m1)" == "linux419-bbswitch" ]]; then
		pacman -Rdd --noconfirm linux419-bbswitch
		pacman -S --noconfirm bbswitch-dkms
    fi
    
    if [[ "$(pacman -Qq | grep 'linux419-acpi_call' -m1)" == "linux419-acpi_call" ]]; then
		pacman -Rdd --noconfirm linux419-acpi_call
		pacman -S --noconfirm acpi_call-dkms
    fi
    
    if [[ "$(pacman -Qq | grep 'linux419-broadcom-wl' -m1)" == "linux419-broadcom-wl" ]]; then
		pacman -Rdd --noconfirm linux419-broadcom-wl
		pacman -S --noconfirm broadcom-wl-dkms
    fi
    if [[ "$(pacman -Qq | grep 'linux419-r8168' -m1)" == "linux419-r8168" ]]; then
		pacman -Rdd --noconfirm linux419-r8168
    fi
    
    if [[ "$(pacman -Qq | grep 'linux419-virtualbox-host-modules' -m1)" == "linux419-virtualbox-host-modules" ]]; then
		pacman -Rdd --noconfirm linux419-virtualbox-host-modules
		pacman -S --noconfirm virtualbox-host-dkms
    fi
    
    if [[ "$(pacman -Qq | grep 'linux419-virtualbox-guest-modules' -m1)" == "linux419-virtualbox-guest-modules" ]]; then
		pacman -Rdd --noconfirm linux419-virtualbox-guest-modules
		pacman -S --noconfirm virtualbox-guest-dkms
    fi
	
	if [[ "$(pacman -Qq | grep 'linux57' -m1)" == "linux57" ]]; then
		msg "replacing linux57 with regular linux-zen ..."
		pacman -Rdd --noconfirm linux57
		pacman -Rdd --noconfirm linux57-headers
		pacman -S --noconfirm linux-zen linux-zen-headers
	fi

	if [[ "$(pacman -Qq | grep 'linux57-nvidia-440xx' -m1)" == "linux57-nvidia-440xx" ]]; then
		pacman -Rdd --noconfirm linux57-nvidia-440xx
		pacman -S --noconfirm nvidia-dkms
    fi

	if [[ "$(pacman -Qq | grep 'linux57-bbswitch' -m1)" == "linux57-bbswitch" ]]; then
		pacman -Rdd --noconfirm linux57-bbswitch
		pacman -S --noconfirm bbswitch-dkms
    fi
    
    if [[ "$(pacman -Qq | grep 'linux57-acpi_call' -m1)" == "linux57-acpi_call" ]]; then
		pacman -Rdd --noconfirm linux57-acpi_call
		pacman -S --noconfirm acpi_call-dkms
    fi
    
    if [[ "$(pacman -Qq | grep 'linux57-broadcom-wl' -m1)" == "linux57-broadcom-wl" ]]; then
		pacman -Rdd --noconfirm linux57-broadcom-wl
		pacman -S --noconfirm broadcom-wl-dkms
    fi
    if [[ "$(pacman -Qq | grep 'linux57-r8168' -m1)" == "linux57-r8168" ]]; then
		pacman -Rdd --noconfirm linux57-r8168
    fi
    
    if [[ "$(pacman -Qq | grep 'linux57-virtualbox-host-modules' -m1)" == "linux57-virtualbox-host-modules" ]]; then
		pacman -Rdd --noconfirm linux57-virtualbox-host-modules
		pacman -S --noconfirm virtualbox-host-dkms
    fi
    
    if [[ "$(pacman -Qq | grep 'linux57-virtualbox-guest-modules' -m1)" == "linux57-virtualbox-guest-modules" ]]; then
		pacman -Rdd --noconfirm linux57-virtualbox-guest-modules
		pacman -S --noconfirm virtualbox-guest-dkms
    fi
    
    if [[ "$(pacman -Qq | grep 'nvidia-440xx-utils' -m1)" = "nvidia-440xx-utils" ]]; then
		pacman -Rdd --noconfirm nvidia-440xx-utils
		pacman -S --noconfirm nvidia-utils
    fi
    

	if [[ "$(pacman -Qq | grep 'manjaro-hello' -m1)" == "manjaro-hello" ]]; then
		msg "replacing manjaro packages ..."
		pacman -Rdd --noconfirm manjaro-hello
	fi
    
    if [[ "$(pacman -Qq | grep 'bashrc-manjaro' -m1)" == "bashrc-manjaro" ]]; then
        msg "replacing manjaro packages ..."
		pacman -Rdd --noconfirm bashrc-manjaro
		pacman -S --noconfirm bash
    fi
    
    if [[ "$(pacman -Qq | grep 'steam-manjaro' -m1)" == "steam-manjaro" ]]; then
        msg "replacing manjaro packages ..."
		pacman -Rdd --noconfirm steam-manjaro
		pacman -S --noconfirm steam
    fi
    
    if [[ "$(pacman -Qq | grep 'steam-native' -m1)" == "steam-native" ]]; then
		pacman -Rdd --noconfirm steam-native
		pacman -S --noconfirm steam-native-runtime
    fi
    
    if [[ "$(pacman -Qq | grep 'manjaro-alsa' -m1)" == "manjaro-alsa" ]]; then
		pacman -Rdd --noconfirm manjaro-alsa
    fi
    
    if [[ "$(pacman -Qq | grep 'manjaro-pulse' -m1)" == "manjaro-pulse" ]]; then
		pacman -Rdd --noconfirm manjaro-pulse
    fi
    
    if [[ "$(pacman -Qq | grep 'manjaro-printer' -m1)" == "manjaro-printer" ]]; then
		pacman -Rdd --noconfirm manjaro-printer
    fi
    
    if [[ "$(pacman -Qq | grep 'manjaro-zsh-config' -m1)" == "manjaro-zsh-config" ]]; then
		pacman -Rdd --noconfirm manjaro-zsh-config
    fi
    
    if [[ "$(pacman -Qq | grep 'manjaro-browser-settings' -m1)" == "manjaro-browser-settings" ]]; then
		pacman -Rdd --noconfirm manjaro-browser-settings
    fi
    
    if [[ "$(pacman -Qq | grep 'manjaro-settings-samba' -m1)" == "manjaro-settings-samba" ]]; then
		pacman -Rdd --noconfirm manjaro-settings-samba
    fi
    
    if [[ "$(pacman -Qq | grep 'manjaro-icons' -m1)" == "manjaro-icons" ]]; then
		pacman -Rdd --noconfirm manjaro-icons
    fi
    
    if [[ "$(pacman -Qq | grep 'manjaro-hotfixes' -m1)" == "manjaro-hotfixes" ]]; then
		pacman -Rdd --noconfirm manjaro-hotfixes
    fi
    
    if [[ "$(pacman -Qq | grep 'manjaro-firmware' -m1)" == "manjaro-firmware" ]]; then
		pacman -Rdd --noconfirm manjaro-firmware
    fi
    
    if [[ "$(pacman -Qq | grep 'manjaro-release' -m1)" == "manjaro-release" ]]; then
		pacman -Rdd --noconfirm manjaro-release
		pacman -S --noconfirm lsb-release
    fi
    
    if [[ "$(pacman -Qq | grep 'manjaro-keyring' -m1)" == "manjaro-keyring" ]]; then
		pacman -Rdd --noconfirm manjaro-keyring
    fi
    
    if [[ "$(pacman -Qq | grep 'systemd-fsck-silent' -m1)" == "systemd-fsck-silent" ]]; then
		pacman -Rdd --noconfirm systemd-fsck-silent
    fi
    
    if [[ "$(pacman -Qq | grep 'mntray' -m1)" == "mntray" ]]; then
		pacman -Rdd --noconfirm mntray
    fi
    
    if [[ "$(pacman -Qq | grep 'manjaro-documentation-en' -m1)" == "manjaro-documentation-en" ]]; then
		pacman -Rdd --noconfirm manjaro-documentation-en
    fi
    
    if [[ "$(df -T / |tail -n1 |awk '{print $2}')" == "btrfs" ]]; then
		pacman -S --noconfirm grub-btrfs
    fi
    
    if [[ "$(pacman -Qq | grep 'manjaro-application-utility' -m1)" == "manjaro-application-utility" ]]; then
		pacman -Rdd --noconfirm manjaro-application-utility
    fi
    # at last mhwd changes
    
    mhwd -f -a pci nonfree 0300
    
    pacman -Syyuu --noconfirm
    grub-install
    update-grub
    
    }
