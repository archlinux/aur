/*
 * Parser/loader for SREC formatted data.
 *
 * Adapted from ihex2fw.c
 * 
 * Copyright © 2009 Karl Relton <karllinuxtest.relton@ntlworld.com>
 * Copyright © 2008 David Woodhouse <dwmw2@infradead.org>
 * Copyright © 2005 Jan Harkes <jaharkes@cs.cmu.edu>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 */

#include <stdint.h>
#include <arpa/inet.h>
#include <stdio.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#define _GNU_SOURCE
#include <getopt.h>

/* Define a special address for S7 start address records */
#define S3ADDR_START		(0xff400000UL)


struct srec_binrec {
	struct srec_binrec *next; /* not part of the real data structure */
        uint32_t addr;
        uint16_t len;
        uint8_t data[];
};

/**
 * nybble/hex are little helpers to parse hexadecimal numbers to a byte value
 **/
static uint8_t nybble(const uint8_t n)
{
       if      (n >= '0' && n <= '9') return n - '0';
       else if (n >= 'A' && n <= 'F') return n - ('A' - 10);
       else if (n >= 'a' && n <= 'f') return n - ('a' - 10);
       return 0;
}

static uint8_t hex(const uint8_t *data, uint8_t *crc)
{
       uint8_t val = (nybble(data[0]) << 4) | nybble(data[1]);
       *crc += val;
       return val;
}

static int process_srec(uint8_t *data, ssize_t size);
static void file_record(struct srec_binrec *record);
static int output_records(int outfd);

static int wide_records = 0;

int usage(void)
{
	fprintf(stderr, "srec2fw: Convert srec files into binary "
		"representation for use by Linux kernel\n");
	fprintf(stderr, "usage: srec2fw [<options>] <src.hex> <dst.fw>\n");
	fprintf(stderr, "       -w: wide records (16-bit length)\n");
	return 1;
}

int main(int argc, char **argv)
{
	int infd, outfd;
	struct stat st;
	uint8_t *data;
	int opt;

	while ((opt = getopt(argc, argv, "ws")) != -1) {
		switch (opt) {
		case 'w':
			wide_records = 1;
			break;
		default:
			return usage();
		}
	}

	if (optind + 2 != argc)
		return usage();

	if (!strcmp(argv[optind], "-"))
	    infd = 0;
	else
		infd = open(argv[optind], O_RDONLY);
	if (infd == -1) {
		fprintf(stderr, "Failed to open source file: %s",
			strerror(errno));
		return usage();
	}
	if (fstat(infd, &st)) {
		perror("stat");
		return 1;
	}
	data = mmap(NULL, st.st_size, PROT_READ, MAP_SHARED, infd, 0);
	if (data == MAP_FAILED) {
		perror("mmap");
		return 1;
	}

	if (!strcmp(argv[optind+1], "-"))
	    outfd = 1;
	else
		outfd = open(argv[optind+1], O_TRUNC|O_CREAT|O_WRONLY, 0644);
	if (outfd == -1) {
		fprintf(stderr, "Failed to open destination file: %s",
			strerror(errno));
		return usage();
	}
	if (process_srec(data, st.st_size))
		return 1;

	output_records(outfd);
	return 0;
}

static int process_srec(uint8_t *data, ssize_t size)
{
	struct srec_binrec *record, *record_new;
	uint32_t offset = 0;
	uint8_t type, crc, crcbyte = 0;
	int i, j;
	int line = 1;
	int len;

	i = 0;
next_record:
	/* search for the start of record character */
	while (i < size) {
		if (data[i] == '\n') line++;
		if (data[i++] == 'S') break;
	}

	if (i >= size) return 0;
    
	/* Minimum record length would be about 10 characters */
	if (i + 10 > size) {
		fprintf(stderr, "Can't find valid record at line %d\n", line);
		return -EINVAL;
	}

	crc = 1; /* CRC seeded with 1 for each line */
	type = nybble(data[i]); i++;
	len = hex(data + i, &crc); i += 2;
	if (wide_records) {
		len <<= 8;
		len += hex(data + i, &crc); i += 2;
	}
	len = len - 5;
	record = malloc((sizeof (*record) + len + 3) & ~3);
	if (!record) {
		fprintf(stderr, "out of memory for records\n");
		return -ENOMEM;
	}
	memset(record, 0, (sizeof(*record) + len + 3) & ~3);
	record->len = len;

	/* now check if we have enough data to read everything */
	if (i + 10 + (record->len * 2) > size) {
		fprintf(stderr, "Not enough data to read complete record at line %d\n",
			line);
		return -EINVAL;
	}

	record->addr  = hex(data + i, &crc) << 24; i += 2;
	record->addr |= hex(data + i, &crc) << 16; i += 2;
	record->addr |= hex(data + i, &crc) << 8; i += 2;
	record->addr |= hex(data + i, &crc); i += 2;

	for (j = 0; j < record->len; j++, i += 2)
		record->data[j] = hex(data + i, &crc);

	/* check CRC */
	crcbyte = hex(data + i, &crc); i += 2;
	if (crc != 0) {
		fprintf(stderr, "CRC failure at line %d: got 0x%X, expected 0x%X\n",
			line, crcbyte, (unsigned char)(crcbyte-crc));
		return -EINVAL;
	}

	/* Done reading the record */
	switch (type) {
	case 7:
		/* S7 Start Address Record - we will mutate this
		   into a new S3 record, with the address becoming the
		   data portion */
		record_new = malloc((sizeof (*record) + 4 + 3) & ~3);
		if (!record_new) {
			fprintf(stderr, "out of memory for records\n");
			return -ENOMEM;
		}
		memset(record_new, 0, (sizeof(*record) + 4 + 3) & ~3);
		record_new->len = 4;
		record_new->addr = S3ADDR_START;
		record->addr = htole32(record->addr);
		memcpy(record_new->data, &(record->addr), 4);
		file_record(record_new);
		goto next_record;

	case 3:
		/* S3 Address Record */
		file_record(record);
		goto next_record;

	default:
		fprintf(stderr, "Unknown record (type %02X)\n", type);
	}

	return -EINVAL;
}

static struct srec_binrec *records;

static void file_record(struct srec_binrec *record)
{
	struct srec_binrec **p = &records;

	while ((*p) && ((*p)->addr < record->addr))
		p = &((*p)->next);

	record->next = *p;
	*p = record;
}

static int output_records(int outfd)
{
	unsigned char zeroes[6] = {0, 0, 0, 0, 0, 0};
	struct srec_binrec *p = records;

	while (p) {
		uint16_t writelen = (p->len + 9) & ~3;

		p->addr = htonl(p->addr);
		p->len = htons(p->len);
		write(outfd, &p->addr, writelen);
		p = p->next;
	}
	/* EOF record is zero length, since we don't bother to represent
	   the type field in the binary version */
	write(outfd, zeroes, 6);
	return 0;
}
