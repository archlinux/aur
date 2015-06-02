#!/usr/bin/env python3

# Written by: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# License: GPLv3

import base64
import hashlib
import os
import re
import shutil

nss_databases = ['passwd', 'group', 'services', 'netgroup', 'automount']

PAM_CONFIG_DIR = '/etc/pam.d/'

def nss_enable_sss():
  if os.path.exists("/etc/nsswitch.conf.sss_tmp"):
    os.remove("/etc/nsswitch.conf.sss_tmp")

  # Backup /etc/nsswitch.conf
  shutil.copyfile("/etc/nsswitch.conf", "/etc/nsswitch.conf.sss_bak")

  nsswitch_orig = open("/etc/nsswitch.conf", 'r')
  nsswitch_new = open("/etc/nsswitch.conf.sss_tmp", 'w')

  while True:
    current_line = nsswitch_orig.readline()
    if not current_line:
      break

    if current_line != '\n' and current_line.split()[0][:-1] in nss_databases:
      if "sss" in current_line:
        print("sss is already enabled for the NSS " +
              current_line.split()[0][:-1] + " database")
      else:
        print("Enabling sss support for the NSS " +
              current_line.split()[0][:-1] + " database...")
        if current_line[-1] == '\n':
          current_line = current_line[:-1] + " sss\n"
        else:
          current_line += " sss"

    # Write new file
    nsswitch_new.write(current_line)

  nsswitch_orig.close()
  nsswitch_new.close()

  # Replace original /etc/nsswitch.conf
  shutil.move("/etc/nsswitch.conf.sss_tmp", "/etc/nsswitch.conf")

def nss_disable_sss():
  if os.path.exists("/etc/nsswitch.conf.sss_tmp"):
    os.remove("/etc/nsswitch.conf.sss_tmp")

  nsswitch_orig = open("/etc/nsswitch.conf", 'r')
  nsswitch_new = open("/etc/nsswitch.conf.sss_tmp", 'w')

  while True:
    current_line = nsswitch_orig.readline()
    if not current_line:
      break

    if current_line != '\n' and current_line.split()[0][:-1] in nss_databases:
      if "sss" in current_line:
        print("Disabling sss for the NSS " +
              current_line.split()[0][:-1] + " database...")
        current_line = re.sub(r"[ \t]+sss[ \t]*", ' ', current_line)
        # Remove extra spaces
        current_line = re.sub(r"[ \t]+\n", '\n', current_line)

    # Write new file
    nsswitch_new.write(current_line)

  nsswitch_orig.close()
  nsswitch_new.close()

  # Replace original /etc/nsswitch.conf
  shutil.move("/etc/nsswitch.conf.sss_tmp", "/etc/nsswitch.conf")

def pam_check_header(pam_config):
  pam_file = open(PAM_CONFIG_DIR + pam_config, 'r')

  inside_header = False
  has_header = False
  sha512sum = ''
  base64enc = ''
  returned = None

  while True:
    current_line = pam_file.readline()
    if not current_line:
      break

    if current_line == '\n' or current_line == '# \n':
      continue

    if current_line == '# -----BEGIN PAM BACKUP-----\n':
      inside_header = True

    elif current_line == '# -----END PAM BACKUP-----\n':
      if not inside_header:
        # Invalid because the begin line is missing
        returned = ('INVALID', None, None)
        break

      has_header = True
      break

    elif inside_header:
      if current_line.startswith('# Hash: '):
        sha512sum = current_line[8:-1]
      elif current_line.startswith('# Data: '):
        base64enc = current_line[8:-1]
      else:
        # Invalid because unknown data is in the header
        returned = ('INVALID', None, None)
        break

  pam_file.close()

  if has_header:
    if sha512sum == hashlib.sha512(base64.b64decode(base64enc)).hexdigest():
      returned = ('VALID', sha512sum, base64enc)
    else:
      # Invalid because the checksum of the data does not match the hash
      returned = ('INVALID', None, None)

  if not returned:
    returned = ('NONE', None, None)

  return returned

def pam_config_setup(pam_config):
  pam_file_orig = open(PAM_CONFIG_DIR + pam_config, 'r')
  pam_file_new = open(PAM_CONFIG_DIR + pam_config + '.sss_tmp', 'a')

  while True:
    current_line = pam_file_orig.readline()
    if not current_line:
      break

    if current_line.startswith('#%PAM-1.0'):
      continue

    if current_line != '\n' and current_line[0] != '#':
      current_line_split = current_line.split()

      # Change 'required' to 'sufficient' for the pam_unix.so module
      if current_line_split[2] == "pam_unix.so" and current_line_split[1] == "required":
        #pam_file_new.write(current_line.replace("required", "sufficient"))
        pam_file_new.write(current_line_split[0] + "\t\tinclude\t\tsss\n")
        continue

    pam_file_new.write(current_line)

  pam_file_orig.close()
  pam_file_new.close()

def pam_enable_sss():
  print('Enabling sssd support in:')

  rows, columns = os.popen('stty size', 'r').read().split()
  columns = int(columns) - 3

  for fullpath, directories, files in os.walk(PAM_CONFIG_DIR):
    files.sort()
    for pam_config in files:
      if pam_config == 'sss' or pam_config == 'sss.bak' or \
         pam_config.startswith('.') or pam_config.endswith('~'):
        continue

      status = pam_check_header(pam_config)[0]
      if status == 'NONE':
        status_msg = 'done'
      elif status == 'VALID':
        status_msg = 'already enabled (skipping)'
      elif status == 'INVALID':
        status_msg = 'invalid backup header (skipping)'

      pam_config_path = PAM_CONFIG_DIR + pam_config

      if status == 'NONE':
        pam_file = open(pam_config_path, 'rb')

        raw_content = pam_file.read()
        sha512sum = hashlib.sha512(raw_content).hexdigest()
        base64enc_raw = base64.b64encode(raw_content)
        base64enc = base64enc_raw.decode('ascii')

        pam_file.close()

        tmp_file = open(pam_config_path + '.sss_tmp', 'w')

        tmp_file.write('#%PAM-1.0\n')
        tmp_file.write('# -----BEGIN PAM BACKUP-----\n')
        tmp_file.write('# Hash: ' + sha512sum + '\n')
        tmp_file.write('# \n')
        tmp_file.write('# Data: ' + base64enc + '\n')
        tmp_file.write('# -----END PAM BACKUP-----\n')
        tmp_file.write('\n')

        tmp_file.close()

        pam_config_setup(pam_config)

        shutil.move(pam_config_path + '.sss_tmp', pam_config_path)

      if len(pam_config_path + status_msg) > columns:
        print(pam_config_path)
        print(('{:>%is} ' % columns + 2).format(status_msg))
      else:
        print(('  {:<%is}{:>%is} ' % \
              (len(pam_config_path), columns - len(pam_config_path))). \
              format(pam_config_path, status_msg))

  if os.path.exists(PAM_CONFIG_DIR + 'sss'):
    print('%ssss already exists. Moving it to %ssss.bak' % \
          (PAM_CONFIG_DIR, PAM_CONFIG_DIR))
    shutil.move(PAM_CONFIG_DIR + 'sss', PAM_CONFIG_DIR + 'sss.bak')

  pam_sss = open(PAM_CONFIG_DIR + 'sss', 'w')
  # Auth
  pam_sss.write("auth     sufficient pam_unix.so nullok try_first_pass\n")
  pam_sss.write("auth     sufficient pam_sss.so use_first_pass\n")
  pam_sss.write("auth     required   pam_deny.so\n")
  # Account
  pam_sss.write("account  required   pam_unix.so\n")
  pam_sss.write("#account  [default=bad success=ok user_unknown=ignore] pam_sss.so\n")
  pam_sss.write("account  optional   pam_sss.so\n")
  # Password
  pam_sss.write("password sufficient pam_unix.so try_first_pass nullok sha512 shadow\n")
  pam_sss.write("password sufficient pam_sss.so use_authtok\n")
  pam_sss.write("password required   pam_deny.so\n")
  # Session
  pam_sss.write("session  required   pam_unix.so\n")
  pam_sss.write("session  optional   pam_sss.so\n")
  pam_sss.close()

def pam_disable_sss():
  print('Disabling sssd support in:')

  rows, columns = os.popen('stty size', 'r').read().split()
  columns = int(columns) - 3

  for fullpath, directories, files in os.walk(PAM_CONFIG_DIR):
    files.sort()
    for pam_config in files:
      if pam_config == 'sss' or pam_config == 'sss.bak' or \
         pam_config.startswith('.') or pam_config.endswith('~'):
        continue

      status, sha512sum, base64enc = pam_check_header(pam_config)
      if status == 'NONE':
        status_msg = 'already disabled (skipping)'
      elif status == 'VALID':
        status_msg = 'done'
      elif status == 'INVALID':
        status_msg = 'invalid backup header (skipping)'

      pam_config_path = PAM_CONFIG_DIR + pam_config

      if status == 'VALID':
        pam_file = open(pam_config_path + '.sss_tmp', 'wb')
        pam_file.write(base64.b64decode(base64enc))
        pam_file.close()
        shutil.move(pam_config_path + '.sss_tmp', pam_config_path)

      if len(pam_config_path + status_msg) > columns:
        print(pam_config_path)
        print(('{:>%is} ' % columns + 2).format(status_msg))
      else:
        print(('  {:<%is}{:>%is} ' % \
              (len(pam_config_path), columns - len(pam_config_path))). \
              format(pam_config_path, status_msg))

  if os.path.exists(PAM_CONFIG_DIR + 'sss'):
    os.remove(PAM_CONFIG_DIR + 'sss')

def parse_arguments():
  import argparse
  import textwrap

  arg_parser = argparse.ArgumentParser()
  arg_parser.formatter_class = argparse.RawDescriptionHelpFormatter
  arg_parser.description = textwrap.dedent("""
  Arch Linux sssd authentication setup helper for PAM and NSS
  -----------------------------------------------------------
  """)

  nss_group = arg_parser.add_mutually_exclusive_group()
  nss_group.add_argument("--enable-nss",
                         help="Enable support for SSSD in NSS",
                         action="store_true",
                         dest="nss_action",
                         default=None)
  nss_group.add_argument("--disable-nss",
                         help="Disable support for SSSD in NSS",
                         action="store_false",
                         dest="nss_action",
                         default=None)

  pam_group = arg_parser.add_mutually_exclusive_group()
  pam_group.add_argument("--enable-pam",
                         help="Enable support for SSSD in PAM",
                         action="store_true",
                         dest="pam_action",
                         default=None)
  pam_group.add_argument("--disable-pam",
                         help="Disable support for SSSD in PAM",
                         action="store_false",
                         dest="pam_action",
                         default=None)

  args = arg_parser.parse_args()

  if args.nss_action == None and args.pam_action == None:
    print("No action given!")
    exit(1)

  if os.getuid() != 0:
    print("sss-auth-setup must be run as root!")
    exit(1)

  if args.nss_action != None:
    if args.nss_action:
      nss_enable_sss()
    else:
      nss_disable_sss()

  if args.pam_action != None:
    if args.pam_action:
      pam_enable_sss()
    else:
      pam_disable_sss()

if __name__ == "__main__":
  parse_arguments()
