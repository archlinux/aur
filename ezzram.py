#!/usr/bin/env python3

import sys, subprocess, re, pathlib
from psutil import virtual_memory, cpu_count
from time import sleep

class System:

	@staticmethod
	def compression_algorithms():
		return ("lzo", "zstd", "lz4", "deflate", "lz4hc", "842")

	@staticmethod
	def memory():
		return round(virtual_memory().total/1000**2, 1)

	@staticmethod
	def cpu_cores():
		return cpu_count()

class Config:

	_config = None

	@staticmethod
	def load():
		with open("/etc/ezzram.conf") as conf:
			config_data = conf.read()
		pattern = "([a-z]+).+="
		keys = re.findall(pattern, config_data)
		pattern = "[a-z]+?[\s]+=?[\s]+([a-z0-9]+)?[\s]+?[#]"
		values = re.findall(pattern, config_data)
		Config._config = {i[0]:i[1] for i in zip(keys, values)}

	@staticmethod
	def zram_size():
		_zram_size = int(Config._config["size"])
		assert  0 < _zram_size <= System.memory()/2
		return _zram_size

	@staticmethod
	def algorithm():
		_algorithm = Config._config["algorithm"]
		assert _algorithm in System.compression_algorithms()
		return _algorithm

	@staticmethod
	def cpu_cores():
		_cores = int(Config._config["cores"])
		assert _cores <= System.cpu_cores()
		return _cores

class Zram:

	@staticmethod
	def active_devices():
		_devices = []
		for path in pathlib.Path("/dev/").iterdir():
			if "zram" in str(path) and path.is_block_device():
				_devices.append(re.search("/dev/zram([0-9]+)", str(path)).group(1))
		return _devices

	@staticmethod
	def module_loaded():
		return pathlib.Path("/sys/module/zram").exists()

	@staticmethod
	def load_module():
		subprocess.run(f"modprobe zram".split(), check=True)
		if not Zram.module_loaded():
			raise Exception("Zram module failed to load")

	@staticmethod
	def add_device():
		with open("/sys/class/zram-control/hot_add") as sysfs:
			device = sysfs.read()
		try:
			device = int(device)
		except:
			pass
		if not isinstance(device, int):
			raise Exception(device)
		return device
		
	@staticmethod
	def remove_device(i):
		with open("/sys/class/zram/hot_remove", "w") as sysfs:
			sysfs.write(i)
			sysfs.flush()
	
	@staticmethod	
	def reset_device(i):
		with open(f"/sys/block/zram{i}/reset", "w") as sysfs:
			sysfs.write("1")
			sysfs.flush()
			
	def setup_device(i, algorithm, size, streams):
		with open(f"/sys/block/zram{i}/comp_algorithm", "w") as sysfs:
			sysfs.write(algorithm)
			sysfs.flush()
		with open(f"/sys/block/zram{i}/disksize", "w") as sysfs:
			sysfs.write(f"{size}M")
			sysfs.flush()
		with open(f"/sys/block/zram{i}/max_comp_streams", "w") as sysfs:
			sysfs.write(f"{streams}")
			sysfs.flush()
			
			
def reset_devices():
	for i in Zram.active_devices():
		try:
			swapoff(f"/dev/zram{i}")
		except subprocess.CalledProcessError:
			print(f"/dev/zram{i} may not have been used for swap, we'll skip it")
		Zram.reset_device(i)
		
def mkswap(device):
	subprocess.run(f"mkswap {device}".split(), capture_output=True, check=True)
	print(f"mkswap for {device}")

def swapon(device):
	subprocess.run(f"swapon {device}".split(), capture_output=True, check=True)
	print(f"swapon for {device}")
	
def swapoff(device):
	subprocess.run(f"swapoff {device}".split(), capture_output=True, check=True)
	print(f"removed swap for {device}")
	
def start():
	Config.load()
	if not Zram.module_loaded(): 
		Zram.load_module()
	reset_devices()
	num_devices_needed = Config.cpu_cores() - len(Zram.active_devices())
	hot_devices = []
	pre_hot_active_devices = Zram.active_devices()
	for _ in range(num_devices_needed):
		hot_devices.append(Zram.add_device())
	for i in pre_hot_active_devices + hot_devices:
		Zram.setup_device(i, Config.algorithm(), Config.zram_size()//Config.cpu_cores(), Config.cpu_cores())
		mkswap(f"/dev/zram{i}")
		swapon(f"/dev/zram{i}")
	
if sys.argv[1] == "start": start()
if sys.argv[1] == "stop": reset_devices()
