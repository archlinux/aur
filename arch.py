import os
from sos.policies import PackageManager, LinuxPolicy
from sos.plugins import Plugin

class ArchPolicy(LinuxPolicy):

    distro = "Arch Linux"
    vendor = "Arch Linux"
    vendor_url = "https://www.archlinux.org/"
    vendor_text = ""
    package_manager = PackageManager("pacman --query | awk 'BEGIN {OFS = \"|\"} {print $1,$2}'")
    valid_subclasses = [Plugin]

    @classmethod
    def check(cls):
        try:
            return "archlinux" in open('/etc/os-release', 'r').read()
        except:
            return False
