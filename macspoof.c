// SPDX-FileCopyrightText: Julian Daube
// SPDX-License-Identifier: 0BSD
//
// Report a different MAC address to a program:
//
//   MAC_ADDRESS=01:02:03:04:05:06 LD_PRELOAD=libmacspoof.so program
//
// Answers to ioctl(SIOCGIFHWADDR) are changed for all ethernet interfaces,
// without a valid MAC_ADDRESS everything is passed through.

#define _GNU_SOURCE
#include <net/if.h>
#include <net/if_arp.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/syscall.h>
#include <unistd.h>

static int parse_mac(const char *text, unsigned char mac[6])
{
	int end = -1;

	if (!text || strlen(text) != 17)
		return 0;

	return sscanf(text, "%2hhx:%2hhx:%2hhx:%2hhx:%2hhx:%2hhx%n", &mac[0], &mac[1],
		&mac[2], &mac[3], &mac[4], &mac[5], &end) == 6 && end == 17;
}

int ioctl(int fd, unsigned long request, ...)
{
	va_list args;
	va_start(args, request);
	void *arg = va_arg(args, void *);
	va_end(args);

	int result = (int)syscall(SYS_ioctl, fd, request, arg);

	if (result == 0 && request == SIOCGIFHWADDR) {
		struct ifreq *ifr = arg;
		unsigned char mac[6];

		if (ifr->ifr_hwaddr.sa_family == ARPHRD_ETHER && parse_mac(getenv("MAC_ADDRESS"), mac))
			memcpy(ifr->ifr_hwaddr.sa_data, mac, sizeof(mac));
	}

	return result;
}
