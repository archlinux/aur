#!/usr/bin/luajit

-- version 0.7
-- https://aur.archlinux.org/packages/check-pacman-mtree/

--require "strict"

local ffi = require "ffi"

local C = ffi.C
local libcrypto = ffi.load("crypto")
local libz = ffi.load("z")

local function hex_from_ffi_str(s,n)
        return string.format(string.rep('%02x',n), string.byte(ffi.string(s,n),1,n))
end

local function C_error(str)
      return string.format(str .. ': %s', ffi.string(C.strerror(ffi.errno())))
end


ffi.cdef[[
   static const int LINE_SIZE = 1024;
   static const int BUFFER_SIZE = 32768;

   //libc start
   static const int O_RDONLY = 0;
   static const int SEEK_SET = 0;
   static const int SEEK_END = 2;
   static const int ENOENT = 2;
   char *strerror(int);
   int open (const char *, int, ...);
   int read(int , void *, int);
   int close(int);
   int lseek(int , int , int );
   int readlink(const char *, char *,int);

   //libc stop

   //openssl start
   static const int EVP_MAX_MD_SIZE = 64;
   void *EVP_md5(void);
   void *EVP_sha256(void);
   void *EVP_MD_CTX_create(void);
   int EVP_DigestInit(void *, void *);
   int EVP_DigestUpdate(void *,const void *,int);
   int EVP_DigestFinal_ex(void *,unsigned char *,unsigned int *);
   void EVP_MD_CTX_destroy(void *);
   void EVP_cleanup(void);
   //openssl stop

   //zlib start
   void * gzopen (const char *, const char *);
   int gzclose (void * );
   char * gzgets (void * , char *, int );
   //zlib stop
]]

local function printf_(...)
   return io.write(string.format(...),"\n")
end

-- if size matches we will not do md5/sha256
-- set size to -1 to force MD
local function get_size_md5_sha256(file,size)

   local fh,mdctx_md5,mdctx_sha256
   local fs_size,ret_2,ret_3

   do

      fh = C.open(file,C.O_RDONLY)
      if fh == -1 then return nil,C_error("open " .. file),ffi.errno() end

      fs_size = C.lseek(fh,0,C.SEEK_END)
   
      if size ~= -1 and fs_size ~= size then goto clean_up_short end
      --goto clean_up_short
   
   
      C.lseek(fh,0,C.SEEK_SET)
   
      mdctx_md5 = libcrypto.EVP_MD_CTX_create()
      mdctx_sha256 = libcrypto.EVP_MD_CTX_create()
   
      if mdctx_md5 == nil or mdctx_sha256 == nil then
            ret_2 = "libcrypto.EVP_MD_CTX_create md5/sha256 failed " .. file
            goto clean_up
      end
   
      local md_value_md5 = ffi.new("char[?]",C.EVP_MAX_MD_SIZE)
      local md_value_sha256 = ffi.new("char[?]",C.EVP_MAX_MD_SIZE)
   
      local md_len_md5 = ffi.new("int[1]")
      local md_len_sha256 = ffi.new("int[1]")
   
      local buffer = ffi.new("char[?]",C.BUFFER_SIZE)
   
      if md_value_md5 == nil or md_value_sha256 == nil or md_len_md5 == nil or
         md_len_sha256 == nil or buffer == nil then
         ret_2 = "ffi.new failed " ..file
         goto clean_up
      end
   
      if libcrypto.EVP_DigestInit(mdctx_md5, libcrypto.EVP_md5()) ~= 1 or
         libcrypto.EVP_DigestInit(mdctx_sha256, libcrypto.EVP_sha256()) ~= 1 then
            ret_2 = "libcrypto.EVP_DigestInit md5/sha256 failed " .. file
            goto clean_up
      end
   
      while (1) do
         local n = C.read(fh,buffer, C.BUFFER_SIZE)
         --we should make something better for read ret < 0
         if n <= 0 then break end
         if libcrypto.EVP_DigestUpdate(mdctx_md5,buffer,n) ~= 1 or
            libcrypto.EVP_DigestUpdate(mdctx_sha256,buffer,n) ~= 1 then
               ret_2 = "libcrypto.EVP_DigestUpdate md5/sha256 failed " .. file
               goto clean_up
         end
      end
   
      if libcrypto.EVP_DigestFinal_ex(mdctx_md5, md_value_md5, md_len_md5) ~= 1 or
         libcrypto.EVP_DigestFinal_ex(mdctx_sha256, md_value_sha256, md_len_sha256) ~= 1 then
           ret_2 = "libcrypto.EVP_DigestFinal_ex md5/sha256 failed " .. file
           goto clean_up
      end
   
      ret_2,ret_3 = hex_from_ffi_str(md_value_md5,md_len_md5[0]),hex_from_ffi_str(md_value_sha256,md_len_sha256[0])

   end

   ::clean_up::
      if mdctx_md5 ~= nil then libcrypto.EVP_MD_CTX_destroy(mdctx_md5) end
      if mdctx_sha256 ~= nil then libcrypto.EVP_MD_CTX_destroy(mdctx_sha256) end

   ::clean_up_short::
      if fh >= 0 then C.close(fh) end

   return fs_size,ret_2,ret_3

end

local function get_symlink(file)
   local line = ffi.new("char[?]",C.LINE_SIZE)
   if line == nil then return nil,"ffi.new failed " ..file end
   local size = C.readlink(file,line,C.LINE_SIZE-1)

   if size == -1 then return nil,C_error("readlink " .. file),ffi.errno() end

   return ffi.string(line,size)
end

local function check_1_mtree_file(pkg,fs_root,verbose,file)
   local line = ffi.new("char[?]",C.LINE_SIZE)
   if line == nil then return nil,"ffi.new failed " ..file end

   local gz_fh = libz.gzopen(file,"r")
   if gz_fh == nil then return nil,C_error("gzopen " .. file) end
   --libz.gzbuffer(gz_fh,65536)

   local file,root_file,size,md5,sha256
   local fs_size,symlink_linkto,link_fs
   local status,msg,aaa,bbb
   local l_line
   while(1) do
      if libz.gzgets(gz_fh,line,C.LINE_SIZE) == nil then break end
      
      l_line = ffi.string(line)
      file,size,md5,sha256 = string.match(l_line, "^(%S+) .* size=(%S+) md5digest=(%S+) sha256digest=(%S+)")
      if file and size and md5 and sha256 then
         if size then size=tonumber(size) end
      else
         file,symlink_linkto = string.match(l_line,"^(%S+) .* type=link link=(.*)%s$")
         if file and symlink_linkto then
            --printf_("symlink_name=%s symlink_linkto=%s",file,symlink_linkto)
            symlink_linkto = string.gsub(symlink_linkto,"\\%d%d%d",
               function(str) return string.char(tonumber(string.sub(str,2,-1),8)) end
            )
         else goto continue
         end
      end

      --print (file,size,md5,sha256)
      file = string.gsub(file,"^%./","",1)
      if file == '.PKGINFO' or file == '.INSTALL' or file == '.CHANGELOG' then
         goto continue
      end

      file = string.gsub(file,"\\%d%d%d",
         function(str) return string.char(tonumber(string.sub(str,2,-1),8)) end
      )
      --print (file,size,md5,sha256)
      root_file = fs_root .. file

      if not size then
         --goto continue
         -- we are here so this is not a file, so maybe symlink or other type
         link_fs,aaa,bbb = get_symlink(root_file)
         -- status is nil so in aaa we have str_err and in bbb we have C.errno
         if link_fs == nil then
            if(bbb == C.ENOENT) then
            --if(string.match(msg,"No such file")) then
               if verbose > 0 then
                  printf_("EXTRA_MTREE pkg=%s symlink=%s link=%s",pkg,file,symlink_linkto)
               else
                  printf_("EXTRA_MTREE pkg=%s symlink=%s",pkg,file)
               end
            else
               printf_("FAIL check_symlink %s",aaa)
            end
         else
            if link_fs ~= symlink_linkto then
                  if verbose > 0 then
                     printf_("DIFF pkg=%s symlink=%s link_mtree=%s link_fs=%s",pkg,file,symlink_linkto,link_fs)
                  else
                     printf_("DIFF pkg=%s symlink=%s",pkg,file)
                  end
            end
         end

         goto continue
      end

      -- here we are in type=file case

      -- goto continue

      if verbose > 0 then fs_size,aaa,bbb = get_size_md5_sha256(root_file,-1)
      else fs_size,aaa,bbb = get_size_md5_sha256(root_file,size)
      end

      if not fs_size then
         -- fs_size is nil so in aaa we have str_err and in bbb we have C.errno
         if(bbb == C.ENOENT) then
         --if(string.match(msg,"No such file")) then
            if verbose > 0 then
               printf_("EXTRA_MTREE pkg=%s file=%s size_mtree=%s md5_mtree=%s sha256_mtree=%s",pkg,file,size,md5,sha256)
            else
               printf_("EXTRA_MTREE pkg=%s file=%s",pkg,file)
            end
         else
            printf_("FAIL get_size_md5_sha256 %s",aaa)
         end
         goto continue
      end

      --print(file,type(size),size,type(fs_size),fs_size,aaa,bbb)
      if fs_size ~= size or aaa ~= md5 or bbb ~= sha256 then
         if verbose > 0 then
            printf_("DIFF pkg=%s file=%s size_mtree=%d size_fs=%d md5_mtree=%s md5_fs=%s sha256_mtree=%s sha256_fs=%s",pkg,file,size,fs_size,md5,aaa,sha256,bbb)
         else 
            printf_("DIFF pkg=%s file=%s",pkg,file)
         end
         goto continue
      end

      
      --printf_("MATCH pkg=%s file=%s",pkg,file)
      
      --C.printf("LINE %s",line)

      ::continue::
   end
   
   libz.gzclose(ffi.gc(gz_fh,nil))

   return true
end


local function main(arg)
   local mtree_root = "/var/lib/pacman/local"
   local fs_root = "/"
   local pacman_list_pkg = "pacman -Q"
   local msg
   local check_all_pkgs = false
   local verbose = 0

   if not arg[1] then
      print("usage: " .. arg[0] .. " [ -a | pkg1 pkg2...] [-v | -vv] )")
      print("-a  = all pkgs")
      print("-v  = verbose(include size/md5/sha256)")
      print("-vv = even more verbose(show PKG= lines)")
      --printf_("%c%c%c@%04x.%c%c%c",99,103,109,255,110,101,116)
      
      return -1
   end

   for i,v in pairs(arg) do
      if i < 1 then goto continue end
      if v == '-v' then
         verbose = verbose + 1
         arg[i] = nil
      elseif v == '-vv' then
         verbose = verbose + 2
         arg[i] = nil
      elseif v == '-a' then
         check_all_pkgs = true
      elseif v == '-av' then
         check_all_pkgs = true
         verbose = verbose + 1
      elseif v == '-avv' then
         check_all_pkgs = true
         verbose = verbose + 2
      end
      ::continue::
   end
   
   --local file = io.stdin
   --if arg[1] and arg[1] ~= '-' then
   --   file,msg = io.open (arg[1])
   --   assert(file,msg)
   --end

   local fh_cmd,msg = io.popen(pacman_list_pkg,"r")
   if not fh_cmd then
      printf_("pacman cmd error %s",msg)
      return
   end

   for pkg in fh_cmd:lines() do
   --for pkg in io.stdin:lines() do
   --for pkg in lfs.dir(mtree_root) do
      if pkg == "." or pkg == ".." then goto continue end

      if not check_all_pkgs then
         local match = false
         for i,k in pairs(arg) do
            if i >= 1 and string.match(pkg,k) then
               match = true
               break
            end
         end
         if not match then goto continue end

      end
      pkg = string.gsub(pkg," ","-")
      --local pkg,ver = string.match(line, "^(%S+) (%S+)")
      if verbose > 1 then printf_("PKG=%s",pkg) end
      local ret,msg = check_1_mtree_file(pkg,fs_root,verbose,string.format("%s/%s/mtree",mtree_root,pkg))
      if not ret then printf_("FAIL mtree_file pkg=%s %s",pkg,msg) end
      
      ::continue::
   end

   fh_cmd:close()
   --if file ~= io.stdin then file:close() end
   
   libcrypto.EVP_cleanup()
end
-----------------------------------------------------------
-----------------------------------------------------------
--print(check_symlink(arg[1],arg[2]))
--print(get_openssl_evp_md5_sha256_for_file(arg[1]))
return main(arg)
