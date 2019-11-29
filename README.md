# GitHub Actions

Provides an Arch Linux package for the GitHub Actions remote runner.

## Motivation

I wanted to use GitHub Actions remote runner to access the GPU on my server. Because of the security risks of having a public runner instance, I put it inside a `systemd-nspawn` container. I wanted a convenient way to install the GitHub Actions runner, so I decided to package it up.

## Installation

First, clone the repository:

	git clone https://aur.archlinux.org/github-actions.git

The build and install it:

	cd github-actions
	makepkg -fi

Configure the daemon:

	cd /opt/github-actions
	./config.sh --token ...

Then start it up:

	sudo systemctl enable --now github-actions

## Usage

You might want to combine this with a container. To create a container (including some suggested packages):

	pacstrap -c github-actions base ruby clang pkg-build vim

Then, import it:

	machinectl import-fs github-actions

Configure it:

	$ cat /etc/systemd/nspawn/github-actions.nspawn 
	[Exec]
	Boot=true
	PrivateUsers=no

	[Network]
	Private=no
	VirtualEthernet=no

	[Files]
	TemporaryFileSystem=/tmp
	
	# Expose GPU:
	Bind=/dev/nvidia0
	Bind=/dev/nvidiactl

Boot it:

	sudo systemctl enable --now systemd-nspawn@github-actions.service

### Limits

Limit the memory consumption of your container to 2 GiB:

	systemctl set-property systemd-nspawn@myContainer.service MemoryMax=2G

Limit the CPU time usage to roughly the equivalent of 2 cores:

	systemctl set-property systemd-nspawn@myContainer.service CPUQuota=200%

### Attaching Shell

	sudo machinectl shell github-actions

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Released under the MIT license.

Copyright, 2019, by [Samuel Williams](https://www.codeotaku.com).

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
