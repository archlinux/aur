# -*- mode: ruby -*-
# vi: set ft=ruby :

NAME = 'Egor Tensin'
EMAIL = 'egor@tensin.name'

Vagrant.configure("2") do |config|
  config.vm.box = "archlinux/archlinux"

  config.vm.provider "libvirt" do |v|
    v.cpus = 2
    v.memory = 4096
  end

  # Install the required packages:
  config.vm.provision "shell", inline: <<-SHELL
#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail
pacman --noconfirm -Syu base-devel git
  SHELL

  # Working with the git repository:
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail
git config --global user.name '#{NAME}'
git config --global user.email '#{EMAIL}'
  SHELL
  config.ssh.forward_agent = true

  config.vm.provision :reload
end
