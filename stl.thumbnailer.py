#!/usr/bin/python2



import os
import sys
import time
import hashlib


fin = ""
fout = ""
size = ""

def main( ):
	
	m = hashlib.md5()
	m.update(fin)
	

	ff = "/tmp/stl_to_png_%s.scad" % m.hexdigest()

	f = open(ff,"w")
	f.write("color([__color__]) import(\"%s\");"%fin)
	f.close()


	cmd = "openscad -o %s.png --imgsize=%s,%s %s 2> /dev/null; mv %s.png %s" % (fout, size,size,ff,fout,fout)
	os.system(cmd)

	os.remove(ff)

	sys.exit(0)
		

if __name__ == '__main__':

	f = open("/tmp/stl_to_png_tmp.log","w")
	f.write("%i %s"%(len(sys.argv),sys.argv))
	f.close()	

	if len(sys.argv) <> 4:
		print "add args [in file] [out file] [size]"
		sys.exit(0)
	else:
		fin = sys.argv[1]
		fout = sys.argv[2]
		size = sys.argv[3]

	main( )
