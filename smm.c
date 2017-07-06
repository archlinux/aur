/*
 * smm.c -- Utility to test SMM BIOS calls on Inspiron 8000 laptops
 *
 * Copyright (C) 2017 Vitor Augusto <vitorafsr@gmail.com>
 * Copyright (C) 2001  Massimo Dal Zotto <dz@debian.org>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2, or (at your option) any
 * later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * WARNING!!! READ CAREFULLY BEFORE USING THIS PROGRAM!!!
 *
 * THIS PROGRAM IS VERY DANGEROUS. IT CAN CRASH YOUR COMPUTER, DESTROY DATA
 * ON THE HARDISK, CORRUPT THE BIOS, PHYSICALLY DAMAGE YOUR HARDWARE AND
 * MAKE YOUR COMPUTER TOTALLY UNUSABLE.
 *
 * DON'T USE THIS PROGRAM UNLESS YOU REALLY KNOW WHAT YOU ARE DOING. I WILL
 * NOT BE RESPONSIBLE FOR ANY DIRECT OR INDIRECT DAMAGE CAUSED BY USING THIS
 * PROGRAM.
 */
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/io.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <unistd.h>

#define I8K_SMM		_IOWR('i', 0x88, size_t)

int
main(int argc, char **argv)
{
	int registers[6];
	if (argc < 2) {
		fprintf(stderr, "Usage: %s eax ebx ecx edx esi edi\n", argv[0]);
		exit(1);
	}

    if (argc > 1) registers[0] = strtol(argv[1],NULL,16);
    if (argc > 2) registers[1] = strtol(argv[2],NULL,16);
    if (argc > 3) registers[2] = strtol(argv[3],NULL,16);
    if (argc > 4) registers[3] = strtol(argv[4],NULL,16);
    if (argc > 5) registers[4] = strtol(argv[5],NULL,16);
    if (argc > 6) registers[5] = strtol(argv[6],NULL,16);

	int fp = open("/proc/i8k", O_WRONLY);
	if (fp == -1) {
		perror("Error opening file /proc/i8k\n");
		return -1;
	}

	fp = ioctl(fp, I8K_SMM, &registers);
	if (fp == -1) {
		perror("Error on ioctl\n");
		fprintf(stderr, "Err no. %d\n", fp);
		close(fp);
		return -1;
	}

	close(fp);

    return 0;
}

/* end of file */
