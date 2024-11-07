#!/usr/bin/env python3

import os
import sys
from vapoursynth import core
import havsfunc

# VapourSynth Settings
core.num_threads = int(os.getenv("VS_NUM_THREADS", "4"))

video = core.ffms2.Source(os.getenv("VS_SOURCE"))

video = havsfunc.QTGMC(Input=video,
						Preset=os.getenv("QTGMC_PRESET", "very slow"),
						TFF=bool(os.getenv("QTGMC_TFF", "True")),
						SourceMatch=int(os.getenv("QTGMC_SOURCEMATCH", "3")),
						Sharpness=float(os.getenv("QTGMC_SHARPNESS", "0")),
						TR2=int(os.getenv("QTGMC_TR2", "0")),
						Lossless=int(os.getenv("QTGMC_LOSSLESS", "2")))

video.set_output()
