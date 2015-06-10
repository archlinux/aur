#!/bin/bash

build() {
    add_module "radeon"
    add_module "nouveau"
    add_module "i915"
    add_module "via-agp"
    add_module "sis-agp"
    add_module "intel-agp"

    if [[ $(uname -m) == i686 ]]; then
        add_module "amd64-agp"
        add_module "ati-agp"
        add_module "sworks-agp"
        add_module "ali-agp"
        add_module "amd-k7-agp"
        add_module "nvidia-agp"
        add_module "efficeon-agp"
    fi
}

help() {
    cat << HELPEOF
Adds all common KMS drivers to the initramfs image.
HELPEOF
}
