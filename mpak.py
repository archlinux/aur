#!/usr/bin/env python
"""
	MPAK package handling utility
	Version 1.4 (Python-implementation)
	Copyright (c) 2008, Mika Halttunen. <http://www.mhgames.co.nr>

	This command line tool allows creation and extraction of MPAK (.mpk) packages used
	in several of my games. MPAK is a simple WAD-like file format of mine, that allows storing
	the game data in one single .mpk file. I originally had a very crude command line program
	bit like this one (written in C++), and decided to write this Python-implementation as
	an Python-programming excercise. So, it's my first Python program. :)

	Version history:
	v1.4: The first Python version
	v1.0 -- v1.31: The original C++ implementation
"""
import getopt, sys
import os
import traceback
import struct
import binascii
import fnmatch
import shutil
from ctypes import c_uint32

def usage():
	"""
	Prints the program usage.
	"""
	print("MPAK package handling utility")
	print("Version 1.4 (Python-implementation)")
	print("Copyright (c) 2008, Mika Halttunen.")
	print("")
	print("Usage:", sys.argv[0],"[switch]","-f pakfile.mpk","[file1]","[file2]", "[...]", "[fileN]")
	print("where [switch] is one of the following:")
	print("  -f, --file=FILE   Use package FILE")
	print("  -c, --create      Create a new package with files 'file1' to 'fileN'")
	print("  -l, --list        List the files from given package")
	print("  -e, --extract     Extract all files (by default) from given package. If you")
	print("                    want to only extract some specific files, you can name")
	print("                    them individually, and/or use wildcards (i.e. *.png).")
	print("                    You can supply path where to extract with -p.")
	print("  -p, --path=PATH   Extract to PATH (created if doesn't exist)")
	print("  -h, --help        Print this usage text")
	print("")


def errorMsg(msg):
	"""
	Prints an error message and exits.
	"""
	try:
		pos = traceback.extract_stack(limit=2)
		if pos:
			print("ERROR: In %s:%s, line %d:" % (pos[0][0], pos[0][2], pos[0][1]))
		else:
			print("ERROR:")
		print("\t",msg)
	except:
		if __debug__:
			traceback.print_exc()
		pass
	sys.exit(2)


def separator():
	"""
	Prints the separator line.
	"""
	print("-"*75)


def computeCRC(file, offset):
	"""
	Computes the CRC32 for the file, starting at given offset.
	"""
	f = open(file, "rb")
	f.seek(offset)
	crc = 0

	# Compute a running CRC32 for the file in 16kb chunks
	while True:
		buffer = f.read(16384)
		if not buffer: break		# End of file

		crc = binascii.crc32(buffer, crc)

	f.close()
	return crc


def createPackage(pakFile, files):
	"""
	Creates a new MPAK package.

	This copies the given files into the new package file, writes the file table
	and closes the package. MPAK doesn't support adding new files to an existing
	package.
	"""
	print("Creating '%s'.." % pakFile)
	if len(files) < 1: errorMsg("No input files specified!")
	separator()

	# Open the package file for writing
	out = open(pakFile, "wb")

	# Write the header and reserve 4+4 bytes for CRC32 and file table offset
	out.write(b"MPK1")
	out.write(b"."*8)

	# Write each file
	package = { "fileNames": [], "fileOffsets": [] }
	count = 0
	for file in files:
		# Get the basename
		filename = os.path.basename(file)
		print(" <%s..." % filename, end=' ')
		package["fileNames"].append(filename)

		# Get the file size in bytes
		stats = os.stat(file)

		# Store the current offset
		package["fileOffsets"].append(out.tell())

		# Open the file and copy its contents
		f = open(file, "rb")
		shutil.copyfileobj(f, out, 16384)
		f.close()

		print("OK. (%.1f KB)" % (stats.st_size / 1024.0))
		count = count + 1

	separator()

	# Grab the file table offset and write the table
	ftOffset = out.tell()

	# Write the number of files
	out.write(struct.pack("<L", count))

	# Write the file information
	for i in range(count):
		# File name length
		length = len(package["fileNames"][i]) + 1
		out.write(struct.pack("B", length))
		# File name, plus one zero for the C++ implementation
		out.write(package["fileNames"][i].encode('ascii'))
		out.write(struct.pack("B", 0))
		# File offset
		out.write(struct.pack("<L", package["fileOffsets"][i]))

	# Update the header to have the correct file table offset
	out.seek(8)
	out.write(struct.pack("<L", ftOffset))

	# Compute the CRC32 and write it to the header
	out.flush()
	crc32 = c_uint32(0)
	crc32.value = computeCRC(pakFile, 8)
	out.seek(4)
	out.write(struct.pack("<L", crc32.value))

	print("Added %d files to %s" % (count, pakFile))
	print("Package '%s' created successfully. CRC32 checksum is %s." % (pakFile, hex(crc32.value)))
	out.close()


def readPackage(pakFile):
	"""
	Opens the given MPAK package, reads its information and stores it to a
	package dictionary. Returns the dictionary.
	"""
	packageInfo = { "filename": pakFile }

	f = open(pakFile, 'rb')
	if f.read(4) != b"MPK1": errorMsg("Unsupported file format!")

	# Read the CRC32 checksum and the file table header offset
	buffer = f.read(8)
	crc32, headerOffset = struct.unpack("<LL", buffer)
	crc32 = int(crc32)
	packageInfo["crc"] = crc32

	# Check that the CRC32 matches
	checksum = c_uint32(0)
	checksum.value = computeCRC(pakFile, 8)
	if checksum.value != crc32:
		f.close()
		errorMsg("Checksum doesn't match; perhaps a corrupted package?")

	# Seek to the file table, and read the number of files
	f.seek(headerOffset)
	numFiles = struct.unpack("<L", f.read(4))[0]
	packageInfo["numFiles"] = numFiles

	# Read the file information
	fileNames = []
	fileOffsets = []
	for i in range(numFiles):
		namelen = struct.unpack("B", f.read(1))[0]
		file = f.read(namelen)
		offset = struct.unpack("<L", f.read(4))[0]
		fileNames.append(file[:-1].decode('ascii'))		# Remove the trailing null character
		fileOffsets.append(offset)

	# Compute the file sizes from the offsets
	fileSizes = []
	for i in range(numFiles-1):
		fileSizes.append(fileOffsets[i+1] - fileOffsets[i])
	fileSizes.append(headerOffset - fileOffsets[numFiles-1])

	# Store the information
	packageInfo["fileNames"] = fileNames
	packageInfo["fileOffsets"] = fileOffsets
	packageInfo["fileSizes"] = fileSizes
	f.close()
	return packageInfo


def listPackage(pakFile):
	"""
	Lists the contents of a MPAK package.
	"""
	print("Listing '%s'.." % pakFile)
	package = readPackage(pakFile)

	# Print the listing
	numFiles = package["numFiles"]
	print("'%s' (CRC32: %s) contains %d files:" % (pakFile, hex(package["crc"]), numFiles))
	print("")
	print(" NUM : FILE                           : SIZE(KB)   : OFFSET")
	separator()
	for i in range(numFiles):
		print(" %3d : %30s : %-10.1f : (at %s)" % (i+1, package["fileNames"][i], package["fileSizes"][i] / 1024.0, hex(package["fileOffsets"][i])))

	separator()
	print(" NUM : FILE                           : SIZE(KB)   : OFFSET")


def extractPackage(pakFile, path, filters):
	"""
	Extracts files from a package to given path.

	By default extracts all the files. Can be given list of wildcards (i.e. *.png) to
	extract only the files that match given wildcards. Wildcards can also be file names
	from the package.

	The given path is created if it doesn't exist.
	If the path is just a single directory name, it's assumed to exist in the current
	working directory.
	"""
	print("Extracting files from '%s' to %s.." % (pakFile, path))
	package = readPackage(pakFile)

	# Try to create the path if it doesn't exist
	path = os.path.abspath(path)
	if not os.path.exists(path):
		print("Path",path,"doesn't exist, creating it..")
		try:
			os.makedirs(path)
		except:
			errorMsg("Unable to create directory " + path + "!");

	separator()

	# Open the file, and extract all the individual files from it
	count = 0
	f = open(pakFile, "rb")
	for i in range(package["numFiles"]):
		# Test if the file name matches the given wildcard
		if len(filters) > 0:
			for filter in filters:
				if fnmatch.fnmatch(package["fileNames"][i], filter):
					break
			else: continue

		print(" >%s..." % package["fileNames"][i], end=' ')
		# Seek to the correct offset
		f.seek(package["fileOffsets"][i])

		# Open a new file for writing, and write the file out in 16kb chunks
		out = open(os.path.join(path, package["fileNames"][i]), "wb")
		bytesWritten = 0
		bytesTotal = package["fileSizes"][i];
		while True:
			# We have to watch not to write too much
			bytesLeft = bytesTotal - bytesWritten
			if bytesLeft > 16384: bytesLeft = 16384

			buffer = f.read(bytesLeft)
			out.write(buffer)
			bytesWritten = bytesWritten + bytesLeft

			if bytesWritten == bytesTotal:
				break

		out.close()
		print("OK.")
		count = count + 1

	f.close()
	separator()
	print("%d (of %d) files extracted to %s." % (count, package["numFiles"], path))


def main():
	"""
	Main method.
	"""
	try:
		# Get the optiosn
		opts, args = getopt.getopt(sys.argv[1:], "f:clep:h", ["file=", "create", "list", "extract", "path=", "help"])
	except getopt.GetoptError as err:
		# Print the program usage and exit
		print("ERROR: " + str(err))
		usage()
		sys.exit(2)

	extractPath = os.getcwd()
	pakFile = None
	action = None

	# Handle the options
	for o, a in opts:
		if o in ("-f", "--file"):
			pakFile = a					# Grab the pakfile
		elif o in ("-c", "--create"):
			action = "create"
		elif o in ("-l", "--list"):
			action = "list"
		elif o in ("-e", "--extract"):
			action = "extract"
		elif o in ("-p", "--path"):
			extractPath = a				# Grab the path
		elif o in ("-h", "--help"):
			usage()
			sys.exit()
		else:
			assert False, "Unhandled option"

	# Check that we got a pakfile
	if pakFile == None:
		usage()
		sys.exit(2)

	if action == "create": createPackage(pakFile, args)
	elif action == "list": listPackage(pakFile)
	elif action == "extract": extractPackage(pakFile, extractPath, args)
	else: usage()
	sys.exit()

if __name__ == "__main__":
	main()

