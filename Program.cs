using System;
using System.IO;
using System.Diagnostics;
namespace YesAnotherAurHelper {
    public class libYAH { 
        public string cachedir="~/.cache";
        public static void SmartPkgInstall(string Package, bool IsAUR)
        {
        //Console.WriteLine("Which Package do you want to install?");
 
        //char curchar;
            char space = ' ';
            int pkgspacecounter = 0;
            if (Package.Contains(' '))
            {
                string[] pkgs;
                //Console.WriteLine("Pered Furichem");
                foreach (char curchar in Package) if (space == curchar) pkgspacecounter++;

                pkgs = Package.Split(' ');
                //Console.WriteLine("Pkgs splitted");
                if (pkgspacecounter > 0)
                {
                    int i = 0;
                    while (i < pkgspacecounter++)
                    {
                        InstallPkg(pkgs[i], IsAUR);
                        i++;
                    }
                }
            }
            else InstallPkg(Package, IsAUR);
        }
        public static void InstallPkg(string Package, bool IsAUR) {
            if (!IsAUR) {
                //Console.WriteLine(Package);
                string Installer = "ruas";
                Process PackageStartInfo = new Process();
                PackageStartInfo.StartInfo.FileName = Installer;
                PackageStartInfo.StartInfo.Arguments = "b pacman -S --needed "+Package;
                PackageStartInfo.Start();
            } 
            else if (IsAUR){
            Process PackageStartInfo = new Process();
            PackageStartInfo.StartInfo.FileName="/bin/ruas";
            PackageStartInfo.StartInfo.Arguments = "b rm -rf "+Package+"/";
            PackageStartInfo.Start();
            PackageStartInfo.WaitForExit();
            PackageStartInfo.StartInfo.FileName = "/bin/git";
            PackageStartInfo.StartInfo.Arguments = "clone https://aur.archlinux.org/"+Package+".git";
            PackageStartInfo.Start();
            PackageStartInfo.WaitForExit();
            PackageStartInfo.StartInfo.FileName="/bin/bash";
            PackageStartInfo.StartInfo.Arguments = "./yahmkpkg.sh "+Package;
            PackageStartInfo.Start();
            PackageStartInfo.WaitForExit();
            //PackageStartInfo.StartInfo.FileName="/bin/makepkg";
            //PackageStartInfo.StartInfo.Arguments = "-siC ";
            //PackageStartInfo.Start();
            //PackageStartInfo.WaitForExit();
            PackageStartInfo.StartInfo.FileName="/bin/bash";
            PackageStartInfo.StartInfo.Arguments = "./yahcd.sh ~"; 
            PackageStartInfo.Start();
            PackageStartInfo.WaitForExit();
            PackageStartInfo.StartInfo.FileName="/bin/ruas";
            PackageStartInfo.StartInfo.Arguments = "b rm -rf "+Package;
            PackageStartInfo.Start();
            PackageStartInfo.WaitForExit();
            }
        }
            public static void RemovePKG(string Package) {
                string Installer = "ruas";
                Process PackageStartInfo = new Process();
                PackageStartInfo.StartInfo.FileName = Installer;
                PackageStartInfo.StartInfo.Arguments = "b pacman -Rcns "+Package;
                PackageStartInfo.Start();
                PackageStartInfo.WaitForExit();      
            }

    }
    public class YAHapp {
        public static void Main(string[] args) {
            string commandpath="";
            int argl = 0;
            foreach (string arg in args) {
            if (arg!="install" && arg != "remove" && arg != "up" && arg!="help"&& arg!=args[0]&& arg!=args[1] && argl!=args.Length-2){
                if (argl!=0) commandpath+=" ";
                commandpath+=arg;
                argl++;                
                }
            }
            //Console.WriteLine(commandpath);
            if (args.Length==0) Console.WriteLine("Please write something in arguments (e.g yah install aur runasunified)");
            else if (args.Length<3 && args[0]!="remove") Console.WriteLine("Please make sure you entered everything correctly!");
            else if (args[0]=="install" && args[1]=="aur") libYAH.SmartPkgInstall(commandpath, true);
            else if (args[0]=="install" && args[1]=="pacman") libYAH.SmartPkgInstall(commandpath, false);
            else if (args[0]=="remove") libYAH.RemovePKG(args[1]);
            else Console.WriteLine("unknown error");
        }
    }
}