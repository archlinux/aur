/*
 * Copyright (C) 2012 Broadcom Corporation.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#ifndef _BCM2079X_H
#define _BCM2079X_H

#define BCMXXC_MAGIC	0xFA

#define BCMXXC_POWER_CTL	_IO(BCMXXC_MAGIC, 0x01)
#define BCMXXC_WAKE_CTL	_IO(BCMXXC_MAGIC, 0x05)
#define BCMXXC_SET_ADDR	_IO(BCMXXC_MAGIC, 0x07)

struct bcm2079x_platform_data {
	unsigned int irq_gpio;
	unsigned int en_gpio;
	unsigned int wake_gpio;
};

#endif
