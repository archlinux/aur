/* javaclassname.c
 *
 * Extracts the class name from a Java class file; intended for use in a Java
 * wrapper of the type supported by the binfmt_misc option in the Linux kernel.
 *
 * Copyright (C) 1999 Colin J. Watson <cjw44@cam.ac.uk>.
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

#include <stdlib.h>
#include <stdio.h>
#include <stdarg.h>
#include <sys/types.h>

/* From Sun's Java VM Specification, as tag entries in the constant pool. */

#define CP_UTF8 1
#define CP_INTEGER 3
#define CP_FLOAT 4
#define CP_LONG 5
#define CP_DOUBLE 6
#define CP_CLASS 7
#define CP_STRING 8
#define CP_FIELDREF 9
#define CP_METHODREF 10
#define CP_INTERFACEMETHODREF 11
#define CP_NAMEANDTYPE 12

/* Define some commonly used error messages */

#define seek_error() error("%s: Cannot seek\n", program)
#define corrupt_error() error("%s: Class file corrupt\n", program)
#define eof_error() error("%s: Unexpected end of file\n", program)
#define utf8_error() error("%s: Only ASCII 1-255 supported\n", program);

char *program;

long *pool;

u_int8_t read_8(FILE *classfile);
u_int16_t read_16(FILE *classfile);
void skip_constant(FILE *classfile, u_int16_t *cur);
void error(const char *format, ...);
int main(int argc, char **argv);

/* Reads in an unsigned 8-bit integer. */
u_int8_t read_8(FILE *classfile)
{
	int b = fgetc(classfile);
	if(b == EOF)
		eof_error();
	return (u_int8_t)b;
}

/* Reads in an unsigned 16-bit integer. */
u_int16_t read_16(FILE *classfile)
{
	int b1, b2;
	b1 = fgetc(classfile);
	if(b1 == EOF)
		eof_error();
	b2 = fgetc(classfile);
	if(b2 == EOF)
		eof_error();
	return (u_int16_t)((b1 << 8) | b2);
}

/* Reads in a value from the constant pool. */
void skip_constant(FILE *classfile, u_int16_t *cur)
{
	u_int16_t len;
	int seekerr = 1;
	pool[*cur] = ftell(classfile);
	switch(read_8(classfile))
	{
	case CP_UTF8:
		len = read_16(classfile);
		seekerr = fseek(classfile, len, SEEK_CUR);
		break;
	case CP_CLASS:
	case CP_STRING:
		seekerr = fseek(classfile, 2, SEEK_CUR);
		break;
	case CP_INTEGER:
	case CP_FLOAT:
	case CP_FIELDREF:
	case CP_METHODREF:
	case CP_INTERFACEMETHODREF:
	case CP_NAMEANDTYPE:
		seekerr = fseek(classfile, 4, SEEK_CUR);
		break;
	case CP_LONG:
	case CP_DOUBLE:
		seekerr = fseek(classfile, 8, SEEK_CUR);
		++(*cur);
		break;
	default:
		corrupt_error();
	}
	if(seekerr)
		seek_error();
}

void error(const char *format, ...)
{
	va_list ap;
	va_start(ap, format);
	vfprintf(stderr, format, ap);
	va_end(ap);
	exit(1);
}

int main(int argc, char **argv)
{
	FILE *classfile;
	u_int16_t cp_count, i, this_class, classinfo_ptr;
	u_int8_t length;

	program = argv[0];

	if(!argv[1])
		error("%s: Missing input file\n", program);
	classfile = fopen(argv[1], "rb");
	if(!classfile)
		error("%s: Error opening %s\n", program, argv[1]);

	if(fseek(classfile, 8, SEEK_SET))  /* skip magic and version numbers */
		seek_error();
	cp_count = read_16(classfile);
	pool = calloc(cp_count, sizeof(long));
	if(!pool)
		error("%s: Out of memory for constant pool\n", program);

	for(i = 1; i < cp_count; ++i)
		skip_constant(classfile, &i);
	if(fseek(classfile, 2, SEEK_CUR))	/* skip access flags */
		seek_error();

	this_class = read_16(classfile);
	if(this_class < 1 || this_class >= cp_count)
		corrupt_error();
	if(!pool[this_class] || pool[this_class] == -1)
		corrupt_error();
	if(fseek(classfile, pool[this_class] + 1, SEEK_SET))
		seek_error();

	classinfo_ptr = read_16(classfile);
	if(classinfo_ptr < 1 || classinfo_ptr >= cp_count)
		corrupt_error();
	if(!pool[classinfo_ptr] || pool[classinfo_ptr] == -1)
		corrupt_error();
	if(fseek(classfile, pool[classinfo_ptr] + 1, SEEK_SET))
		seek_error();

	length = read_16(classfile);
	for(i = 0; i < length; ++i)
	{
		u_int8_t x = read_8(classfile);
		if((x & 0x80) || !x)
		{
			if((x & 0xE0) == 0xC0)
			{
				u_int8_t y = read_8(classfile);
				if((y & 0xC0) == 0x80)
				{
					int c = ((x & 0x1f) << 6) + (y & 0x3f);
					if(c) putchar(c);
					else utf8_error();
				}
				else utf8_error();
			}
			else utf8_error();
		}
		else if(x == '/') putchar('.');
		else putchar(x);
	}
	putchar('\n');
	free(pool);
	fclose(classfile);
	return 0;
}
