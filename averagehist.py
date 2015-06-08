# averagehist.py : average histogram for vapoursynth
# author : ganymede
# requirement : histogram

class AverageHist():
	"""Average histogram for vapoursynth."""
	def __init__(self, core):
		"""core : vapoursynth's core instance."""
		self.core = core
	
	def get_hist(self, clip, mode):
		"""Returns a cropped histogram."""
		if mode == 'Levels':
			clip = self.core.hist.Levels(clip)
			clip = self.core.std.CropRel(clip, (clip.width - 256), 0, 0, (clip.height - 256) )
		elif mode == 'Color':
			clip = self.core.hist.Color(clip)
			clip = self.core.std.CropRel(clip, (clip.width - 256), 0, 0, (clip.height - 256) )
		elif mode == 'Color2':
			clip = self.core.hist.Color2(clip)
			clip = self.core.std.CropRel(clip, (clip.width - 256), 0, 0, (clip.height - 256) )
		elif mode == 'Combined1':
			c1 = self.core.hist.Levels(clip)
			c1 = self.core.std.CropRel(c1, (c1.width - 256), 0, 0, (c1.height - 256) )
			c2 = self.core.hist.Color2(clip)
			c2 = self.core.std.CropRel(c2, (c2.width - 256), 0, 0, (c2.height - 256) )
			clip = self.core.std.StackVertical([c1,c2])
		elif mode == "Combined2":
			c1 = self.core.hist.Levels(clip)
			c1 = self.core.std.CropRel(c1, (c1.width - 256), 0, 0, (c1.height - 256) )
			c2 = self.core.hist.Color2(clip)
			c2 = self.core.std.CropRel(c2, (c2.width - 256), 0, 0, (c2.height - 256) )
			c3 = self.core.hist.Classic(clip)
			c3 = self.core.std.CropRel(c3, (c3.width - 256), 0, 0, 0 )
			c4 = self.core.std.StackVertical([c1,c2])
			if c3.height < c4.height:
				c3 = self.core.std.AddBorders(c3, 0, 0, 0, (c4.height - c3.height), [0,128,128])
			elif c3.height > c4.height:
				c4 = self.core.std.AddBorders(c4, 0, 0, 0, (c3.height - c4.height), [0,128,128])
			clip = self.core.std.StackHorizontal([c3,c4])
		else:
			clip = self.core.hist.Classic(clip)
			clip = self.core.std.CropRel(clip, (clip.width - 256), 0, 0, 0 )
		return clip

	def get_average(self, clip, mode='Classic'):
		"""mode can be one of 'Classic', 'Levels', 'Color', 'Color2', 'Combined1' or 'Combined2'."""
		hist = self.get_hist(clip,mode)
		average = hist[0]
		for i in range(1, clip.num_frames):
			average = self.core.std.Merge( [average, hist[i]], ( 1.0/(i+1) ) )
		return average

def usage():
	msg = '''Usage :
	import averagehist
	AH = averagehist.AverageHist(core)
	clip = AH.get_average(clip, mode='Classic')'''
	print(msg)

if __name__ == '__main__':
	usage()

