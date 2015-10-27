#!/usr/bin/bash

# Copyright (C) 2015 André Silva <emulatorman@parabola.nu>
# Copyright (C) 2015 Márcio Silva <coadde@parabola.nu>
#
# License: GNU GPLv3+
#
# This file is part of Parabola.
#
# Parabola is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Parabola is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Parabola. If not, see <http://www.gnu.org/licenses/>.

for kernel in libre/linux-libre{,-lts,-grsec,-pck} kernels/linux-libre-{audit,knock,grsec-knock,rt,pae,xen,lts-knock}; do
	cd ~/packages/abslibre/$kernel
	sed -i '\|conflicts=| s|"${_replacesarchkernel\[@][/%a-z-]*}" ||' $(grep -rlI 'conflicts')
	cd ~/packages/abslibre
done
