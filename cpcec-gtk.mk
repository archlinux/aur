##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Release
ProjectName            :=cpcec-gtk
ConfigurationName      :=Release
WorkspaceConfiguration := $(ConfigurationName)
WorkspacePath          :=./
ProjectPath            :=/home/norecess464/Development/GitLab/cpcec-gtk
IntermediateDirectory  :=./build-$(ConfigurationName)/
OutDir                 :=./build-$(ConfigurationName)/
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=norecess464
Date                   :=01/05/22
CodeLitePath           :=/home/norecess464/.codelite
LinkerName             :=/usr/bin/g++
SharedObjectLinkerName :=/usr/bin/g++ -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=./build-$(ConfigurationName)/bin/$(ProjectName)
Preprocessors          :=$(PreprocessorSwitch)NDEBUG $(PreprocessorSwitch)RELEASE 
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :=$(IntermediateDirectory)/ObjectsList.txt
PCHCompileFlags        :=
LinkOptions            :=  $(shell pkg-config --libs gtk+-3.0) $(shell pkg-config --libs sdl2)
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). $(IncludeSwitch)$(WorkspacePath)/Source/UI 
IncludePCH             := 
RcIncludePath          := 
Libs                   := $(LibrarySwitch)pthread $(LibrarySwitch)stdc++fs 
ArLibs                 :=  "pthread" "stdc++fs" 
LibPath                := $(LibraryPathSwitch). 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := /usr/bin/ar rcu
CXX      := /usr/bin/g++
CC       := /usr/bin/gcc
CXXFLAGS :=  -std=c++17 -g -O2 -w $(shell pkg-config --cflags gtk+-3.0) $(shell pkg-config --cflags sdl2) $(Preprocessors)
CFLAGS   :=  -g -O2 -w $(Preprocessors)
ASFLAGS  := 
AS       := /usr/bin/as


##
## User defined environment variables
##
CodeLiteDir:=/usr/share/codelite
Objects0=./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkBuilder.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkSignal.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkFileDialog.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_Utils_ByteUtils.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_Utils_FileUtils.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_Utils_Ticker.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_ToolWindows_LibraryWindow.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_ToolWindows_Z80DebuggerWindow.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_Utils_BitmapUtils.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_ToolWindows_VideoDisplayWindow.cpp$(ObjectSuffix) \
	./build-$(ConfigurationName)//Source_UI_DataClasses_ROMPreset.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_Utils_StdUtils.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_Resources.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_Resource.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_DataClasses_Symbols.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_ToolWindows_ASICWindow.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_Utils_Joystick.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_ToolWindows_AboutWindow.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_MainApp.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_ThirdParty_lodepng.cpp$(ObjectSuffix) \
	./build-$(ConfigurationName)//Source_UI_ToolWindows_MemoryWindow.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_AppWindows_MainWindow.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_Emulator.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_Main.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_Devices_FDC.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_AppWindows_SDLWindow.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_Utils_AmstradUtils.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_Devices_ASIC.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_DataClasses_Config.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_CPCEC_cpcec.c$(ObjectSuffix) \
	./build-$(ConfigurationName)//Source_UI_Devices_GateArray.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_Devices_Z80.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_Utils_WindowPosSize.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_ToolWindows_MemoryVizWindow.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkList.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_ToolWindows_ROMConfigWindow.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_AppWindows_ToolWindow.cpp$(ObjectSuffix) ./build-$(ConfigurationName)//Source_UI_ToolWindows_SymbolsWindow.cpp$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: MakeIntermediateDirs $(OutputFile)

$(OutputFile): ./build-$(ConfigurationName)//.d $(Objects) 
	@mkdir -p "./build-$(ConfigurationName)/"
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

PostBuild:
	@echo Executing Post Build commands ...
	rm $(WorkspacePath)/cpcec-gtk/usr/bin/cpcec-gtk
	strip $(WorkspacePath)/build-Release/bin/cpcec-gtk
	cp $(WorkspacePath)/build-Release/bin/cpcec-gtk $(WorkspacePath)/cpcec-gtk/usr/bin/
	cp $(WorkspacePath)/DocImages/*.* $(WorkspacePath)/cpcec-gtk/usr/share/cpcec-gtk/doc/DocImages/
	@echo Done

MakeIntermediateDirs:
	@mkdir -p "./build-$(ConfigurationName)/"
	@mkdir -p ""./build-$(ConfigurationName)/bin""

./build-$(ConfigurationName)//.d:
	@mkdir -p "./build-$(ConfigurationName)/"

PreBuild:
	@echo Executing Pre Build commands ...
	md5sum $(WorkspacePath)/Data/cpcec-gtk.glade > $(WorkspacePath)/Data/new.md5sum
	
	if ! cmp "$(WorkspacePath)/Data/new.md5sum" "$(WorkspacePath)/Data/stamp.md5sum"; then echo "Detected changes on cpcec-gtk.glade"; glib-compile-resources --sourcedir=$(WorkspacePath)/Data --target=$(WorkspacePath)/Source/UI/Resources.cpp --generate-source $(WorkspacePath)/Data/resources.xml; rm $(WorkspacePath)/Data/stamp.md5sum; mv $(WorkspacePath)/Data/new.md5sum $(WorkspacePath)/Data/stamp.md5sum; else rm $(WorkspacePath)/Data/new.md5sum; fi
	@echo Done


##
## Objects
##
./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkBuilder.cpp$(ObjectSuffix): Source/UI/GtkHelpers/GtkBuilder.cpp ./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkBuilder.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/GtkHelpers/GtkBuilder.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_GtkHelpers_GtkBuilder.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkBuilder.cpp$(DependSuffix): Source/UI/GtkHelpers/GtkBuilder.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkBuilder.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkBuilder.cpp$(DependSuffix) -MM Source/UI/GtkHelpers/GtkBuilder.cpp

./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkBuilder.cpp$(PreprocessSuffix): Source/UI/GtkHelpers/GtkBuilder.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkBuilder.cpp$(PreprocessSuffix) Source/UI/GtkHelpers/GtkBuilder.cpp

./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkSignal.cpp$(ObjectSuffix): Source/UI/GtkHelpers/GtkSignal.cpp ./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkSignal.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/GtkHelpers/GtkSignal.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_GtkHelpers_GtkSignal.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkSignal.cpp$(DependSuffix): Source/UI/GtkHelpers/GtkSignal.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkSignal.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkSignal.cpp$(DependSuffix) -MM Source/UI/GtkHelpers/GtkSignal.cpp

./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkSignal.cpp$(PreprocessSuffix): Source/UI/GtkHelpers/GtkSignal.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkSignal.cpp$(PreprocessSuffix) Source/UI/GtkHelpers/GtkSignal.cpp

./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkFileDialog.cpp$(ObjectSuffix): Source/UI/GtkHelpers/GtkFileDialog.cpp ./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkFileDialog.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/GtkHelpers/GtkFileDialog.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_GtkHelpers_GtkFileDialog.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkFileDialog.cpp$(DependSuffix): Source/UI/GtkHelpers/GtkFileDialog.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkFileDialog.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkFileDialog.cpp$(DependSuffix) -MM Source/UI/GtkHelpers/GtkFileDialog.cpp

./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkFileDialog.cpp$(PreprocessSuffix): Source/UI/GtkHelpers/GtkFileDialog.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkFileDialog.cpp$(PreprocessSuffix) Source/UI/GtkHelpers/GtkFileDialog.cpp

./build-$(ConfigurationName)//Source_UI_Utils_ByteUtils.cpp$(ObjectSuffix): Source/UI/Utils/ByteUtils.cpp ./build-$(ConfigurationName)//Source_UI_Utils_ByteUtils.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/Utils/ByteUtils.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_Utils_ByteUtils.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_Utils_ByteUtils.cpp$(DependSuffix): Source/UI/Utils/ByteUtils.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_Utils_ByteUtils.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_Utils_ByteUtils.cpp$(DependSuffix) -MM Source/UI/Utils/ByteUtils.cpp

./build-$(ConfigurationName)//Source_UI_Utils_ByteUtils.cpp$(PreprocessSuffix): Source/UI/Utils/ByteUtils.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_Utils_ByteUtils.cpp$(PreprocessSuffix) Source/UI/Utils/ByteUtils.cpp

./build-$(ConfigurationName)//Source_UI_Utils_FileUtils.cpp$(ObjectSuffix): Source/UI/Utils/FileUtils.cpp ./build-$(ConfigurationName)//Source_UI_Utils_FileUtils.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/Utils/FileUtils.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_Utils_FileUtils.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_Utils_FileUtils.cpp$(DependSuffix): Source/UI/Utils/FileUtils.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_Utils_FileUtils.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_Utils_FileUtils.cpp$(DependSuffix) -MM Source/UI/Utils/FileUtils.cpp

./build-$(ConfigurationName)//Source_UI_Utils_FileUtils.cpp$(PreprocessSuffix): Source/UI/Utils/FileUtils.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_Utils_FileUtils.cpp$(PreprocessSuffix) Source/UI/Utils/FileUtils.cpp

./build-$(ConfigurationName)//Source_UI_Utils_Ticker.cpp$(ObjectSuffix): Source/UI/Utils/Ticker.cpp ./build-$(ConfigurationName)//Source_UI_Utils_Ticker.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/Utils/Ticker.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_Utils_Ticker.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_Utils_Ticker.cpp$(DependSuffix): Source/UI/Utils/Ticker.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_Utils_Ticker.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_Utils_Ticker.cpp$(DependSuffix) -MM Source/UI/Utils/Ticker.cpp

./build-$(ConfigurationName)//Source_UI_Utils_Ticker.cpp$(PreprocessSuffix): Source/UI/Utils/Ticker.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_Utils_Ticker.cpp$(PreprocessSuffix) Source/UI/Utils/Ticker.cpp

./build-$(ConfigurationName)//Source_UI_ToolWindows_LibraryWindow.cpp$(ObjectSuffix): Source/UI/ToolWindows/LibraryWindow.cpp ./build-$(ConfigurationName)//Source_UI_ToolWindows_LibraryWindow.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/ToolWindows/LibraryWindow.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_ToolWindows_LibraryWindow.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_ToolWindows_LibraryWindow.cpp$(DependSuffix): Source/UI/ToolWindows/LibraryWindow.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_ToolWindows_LibraryWindow.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_ToolWindows_LibraryWindow.cpp$(DependSuffix) -MM Source/UI/ToolWindows/LibraryWindow.cpp

./build-$(ConfigurationName)//Source_UI_ToolWindows_LibraryWindow.cpp$(PreprocessSuffix): Source/UI/ToolWindows/LibraryWindow.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_ToolWindows_LibraryWindow.cpp$(PreprocessSuffix) Source/UI/ToolWindows/LibraryWindow.cpp

./build-$(ConfigurationName)//Source_UI_ToolWindows_Z80DebuggerWindow.cpp$(ObjectSuffix): Source/UI/ToolWindows/Z80DebuggerWindow.cpp ./build-$(ConfigurationName)//Source_UI_ToolWindows_Z80DebuggerWindow.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/ToolWindows/Z80DebuggerWindow.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_ToolWindows_Z80DebuggerWindow.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_ToolWindows_Z80DebuggerWindow.cpp$(DependSuffix): Source/UI/ToolWindows/Z80DebuggerWindow.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_ToolWindows_Z80DebuggerWindow.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_ToolWindows_Z80DebuggerWindow.cpp$(DependSuffix) -MM Source/UI/ToolWindows/Z80DebuggerWindow.cpp

./build-$(ConfigurationName)//Source_UI_ToolWindows_Z80DebuggerWindow.cpp$(PreprocessSuffix): Source/UI/ToolWindows/Z80DebuggerWindow.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_ToolWindows_Z80DebuggerWindow.cpp$(PreprocessSuffix) Source/UI/ToolWindows/Z80DebuggerWindow.cpp

./build-$(ConfigurationName)//Source_UI_Utils_BitmapUtils.cpp$(ObjectSuffix): Source/UI/Utils/BitmapUtils.cpp ./build-$(ConfigurationName)//Source_UI_Utils_BitmapUtils.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/Utils/BitmapUtils.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_Utils_BitmapUtils.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_Utils_BitmapUtils.cpp$(DependSuffix): Source/UI/Utils/BitmapUtils.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_Utils_BitmapUtils.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_Utils_BitmapUtils.cpp$(DependSuffix) -MM Source/UI/Utils/BitmapUtils.cpp

./build-$(ConfigurationName)//Source_UI_Utils_BitmapUtils.cpp$(PreprocessSuffix): Source/UI/Utils/BitmapUtils.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_Utils_BitmapUtils.cpp$(PreprocessSuffix) Source/UI/Utils/BitmapUtils.cpp

./build-$(ConfigurationName)//Source_UI_ToolWindows_VideoDisplayWindow.cpp$(ObjectSuffix): Source/UI/ToolWindows/VideoDisplayWindow.cpp ./build-$(ConfigurationName)//Source_UI_ToolWindows_VideoDisplayWindow.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/ToolWindows/VideoDisplayWindow.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_ToolWindows_VideoDisplayWindow.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_ToolWindows_VideoDisplayWindow.cpp$(DependSuffix): Source/UI/ToolWindows/VideoDisplayWindow.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_ToolWindows_VideoDisplayWindow.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_ToolWindows_VideoDisplayWindow.cpp$(DependSuffix) -MM Source/UI/ToolWindows/VideoDisplayWindow.cpp

./build-$(ConfigurationName)//Source_UI_ToolWindows_VideoDisplayWindow.cpp$(PreprocessSuffix): Source/UI/ToolWindows/VideoDisplayWindow.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_ToolWindows_VideoDisplayWindow.cpp$(PreprocessSuffix) Source/UI/ToolWindows/VideoDisplayWindow.cpp

./build-$(ConfigurationName)//Source_UI_DataClasses_ROMPreset.cpp$(ObjectSuffix): Source/UI/DataClasses/ROMPreset.cpp ./build-$(ConfigurationName)//Source_UI_DataClasses_ROMPreset.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/DataClasses/ROMPreset.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_DataClasses_ROMPreset.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_DataClasses_ROMPreset.cpp$(DependSuffix): Source/UI/DataClasses/ROMPreset.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_DataClasses_ROMPreset.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_DataClasses_ROMPreset.cpp$(DependSuffix) -MM Source/UI/DataClasses/ROMPreset.cpp

./build-$(ConfigurationName)//Source_UI_DataClasses_ROMPreset.cpp$(PreprocessSuffix): Source/UI/DataClasses/ROMPreset.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_DataClasses_ROMPreset.cpp$(PreprocessSuffix) Source/UI/DataClasses/ROMPreset.cpp

./build-$(ConfigurationName)//Source_UI_Utils_StdUtils.cpp$(ObjectSuffix): Source/UI/Utils/StdUtils.cpp ./build-$(ConfigurationName)//Source_UI_Utils_StdUtils.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/Utils/StdUtils.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_Utils_StdUtils.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_Utils_StdUtils.cpp$(DependSuffix): Source/UI/Utils/StdUtils.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_Utils_StdUtils.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_Utils_StdUtils.cpp$(DependSuffix) -MM Source/UI/Utils/StdUtils.cpp

./build-$(ConfigurationName)//Source_UI_Utils_StdUtils.cpp$(PreprocessSuffix): Source/UI/Utils/StdUtils.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_Utils_StdUtils.cpp$(PreprocessSuffix) Source/UI/Utils/StdUtils.cpp

./build-$(ConfigurationName)//Source_UI_Resources.cpp$(ObjectSuffix): Source/UI/Resources.cpp ./build-$(ConfigurationName)//Source_UI_Resources.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/Resources.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_Resources.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_Resources.cpp$(DependSuffix): Source/UI/Resources.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_Resources.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_Resources.cpp$(DependSuffix) -MM Source/UI/Resources.cpp

./build-$(ConfigurationName)//Source_UI_Resources.cpp$(PreprocessSuffix): Source/UI/Resources.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_Resources.cpp$(PreprocessSuffix) Source/UI/Resources.cpp

./build-$(ConfigurationName)//Source_UI_Resource.cpp$(ObjectSuffix): Source/UI/Resource.cpp ./build-$(ConfigurationName)//Source_UI_Resource.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/Resource.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_Resource.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_Resource.cpp$(DependSuffix): Source/UI/Resource.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_Resource.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_Resource.cpp$(DependSuffix) -MM Source/UI/Resource.cpp

./build-$(ConfigurationName)//Source_UI_Resource.cpp$(PreprocessSuffix): Source/UI/Resource.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_Resource.cpp$(PreprocessSuffix) Source/UI/Resource.cpp

./build-$(ConfigurationName)//Source_UI_DataClasses_Symbols.cpp$(ObjectSuffix): Source/UI/DataClasses/Symbols.cpp ./build-$(ConfigurationName)//Source_UI_DataClasses_Symbols.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/DataClasses/Symbols.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_DataClasses_Symbols.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_DataClasses_Symbols.cpp$(DependSuffix): Source/UI/DataClasses/Symbols.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_DataClasses_Symbols.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_DataClasses_Symbols.cpp$(DependSuffix) -MM Source/UI/DataClasses/Symbols.cpp

./build-$(ConfigurationName)//Source_UI_DataClasses_Symbols.cpp$(PreprocessSuffix): Source/UI/DataClasses/Symbols.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_DataClasses_Symbols.cpp$(PreprocessSuffix) Source/UI/DataClasses/Symbols.cpp

./build-$(ConfigurationName)//Source_UI_ToolWindows_ASICWindow.cpp$(ObjectSuffix): Source/UI/ToolWindows/ASICWindow.cpp ./build-$(ConfigurationName)//Source_UI_ToolWindows_ASICWindow.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/ToolWindows/ASICWindow.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_ToolWindows_ASICWindow.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_ToolWindows_ASICWindow.cpp$(DependSuffix): Source/UI/ToolWindows/ASICWindow.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_ToolWindows_ASICWindow.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_ToolWindows_ASICWindow.cpp$(DependSuffix) -MM Source/UI/ToolWindows/ASICWindow.cpp

./build-$(ConfigurationName)//Source_UI_ToolWindows_ASICWindow.cpp$(PreprocessSuffix): Source/UI/ToolWindows/ASICWindow.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_ToolWindows_ASICWindow.cpp$(PreprocessSuffix) Source/UI/ToolWindows/ASICWindow.cpp

./build-$(ConfigurationName)//Source_UI_Utils_Joystick.cpp$(ObjectSuffix): Source/UI/Utils/Joystick.cpp ./build-$(ConfigurationName)//Source_UI_Utils_Joystick.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/Utils/Joystick.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_Utils_Joystick.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_Utils_Joystick.cpp$(DependSuffix): Source/UI/Utils/Joystick.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_Utils_Joystick.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_Utils_Joystick.cpp$(DependSuffix) -MM Source/UI/Utils/Joystick.cpp

./build-$(ConfigurationName)//Source_UI_Utils_Joystick.cpp$(PreprocessSuffix): Source/UI/Utils/Joystick.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_Utils_Joystick.cpp$(PreprocessSuffix) Source/UI/Utils/Joystick.cpp

./build-$(ConfigurationName)//Source_UI_ToolWindows_AboutWindow.cpp$(ObjectSuffix): Source/UI/ToolWindows/AboutWindow.cpp ./build-$(ConfigurationName)//Source_UI_ToolWindows_AboutWindow.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/ToolWindows/AboutWindow.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_ToolWindows_AboutWindow.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_ToolWindows_AboutWindow.cpp$(DependSuffix): Source/UI/ToolWindows/AboutWindow.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_ToolWindows_AboutWindow.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_ToolWindows_AboutWindow.cpp$(DependSuffix) -MM Source/UI/ToolWindows/AboutWindow.cpp

./build-$(ConfigurationName)//Source_UI_ToolWindows_AboutWindow.cpp$(PreprocessSuffix): Source/UI/ToolWindows/AboutWindow.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_ToolWindows_AboutWindow.cpp$(PreprocessSuffix) Source/UI/ToolWindows/AboutWindow.cpp

./build-$(ConfigurationName)//Source_UI_MainApp.cpp$(ObjectSuffix): Source/UI/MainApp.cpp ./build-$(ConfigurationName)//Source_UI_MainApp.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/MainApp.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_MainApp.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_MainApp.cpp$(DependSuffix): Source/UI/MainApp.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_MainApp.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_MainApp.cpp$(DependSuffix) -MM Source/UI/MainApp.cpp

./build-$(ConfigurationName)//Source_UI_MainApp.cpp$(PreprocessSuffix): Source/UI/MainApp.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_MainApp.cpp$(PreprocessSuffix) Source/UI/MainApp.cpp

./build-$(ConfigurationName)//Source_UI_ThirdParty_lodepng.cpp$(ObjectSuffix): Source/UI/ThirdParty/lodepng.cpp ./build-$(ConfigurationName)//Source_UI_ThirdParty_lodepng.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/ThirdParty/lodepng.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_ThirdParty_lodepng.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_ThirdParty_lodepng.cpp$(DependSuffix): Source/UI/ThirdParty/lodepng.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_ThirdParty_lodepng.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_ThirdParty_lodepng.cpp$(DependSuffix) -MM Source/UI/ThirdParty/lodepng.cpp

./build-$(ConfigurationName)//Source_UI_ThirdParty_lodepng.cpp$(PreprocessSuffix): Source/UI/ThirdParty/lodepng.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_ThirdParty_lodepng.cpp$(PreprocessSuffix) Source/UI/ThirdParty/lodepng.cpp

./build-$(ConfigurationName)//Source_UI_ToolWindows_MemoryWindow.cpp$(ObjectSuffix): Source/UI/ToolWindows/MemoryWindow.cpp ./build-$(ConfigurationName)//Source_UI_ToolWindows_MemoryWindow.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/ToolWindows/MemoryWindow.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_ToolWindows_MemoryWindow.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_ToolWindows_MemoryWindow.cpp$(DependSuffix): Source/UI/ToolWindows/MemoryWindow.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_ToolWindows_MemoryWindow.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_ToolWindows_MemoryWindow.cpp$(DependSuffix) -MM Source/UI/ToolWindows/MemoryWindow.cpp

./build-$(ConfigurationName)//Source_UI_ToolWindows_MemoryWindow.cpp$(PreprocessSuffix): Source/UI/ToolWindows/MemoryWindow.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_ToolWindows_MemoryWindow.cpp$(PreprocessSuffix) Source/UI/ToolWindows/MemoryWindow.cpp

./build-$(ConfigurationName)//Source_UI_AppWindows_MainWindow.cpp$(ObjectSuffix): Source/UI/AppWindows/MainWindow.cpp ./build-$(ConfigurationName)//Source_UI_AppWindows_MainWindow.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/AppWindows/MainWindow.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_AppWindows_MainWindow.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_AppWindows_MainWindow.cpp$(DependSuffix): Source/UI/AppWindows/MainWindow.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_AppWindows_MainWindow.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_AppWindows_MainWindow.cpp$(DependSuffix) -MM Source/UI/AppWindows/MainWindow.cpp

./build-$(ConfigurationName)//Source_UI_AppWindows_MainWindow.cpp$(PreprocessSuffix): Source/UI/AppWindows/MainWindow.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_AppWindows_MainWindow.cpp$(PreprocessSuffix) Source/UI/AppWindows/MainWindow.cpp

./build-$(ConfigurationName)//Source_UI_Emulator.cpp$(ObjectSuffix): Source/UI/Emulator.cpp ./build-$(ConfigurationName)//Source_UI_Emulator.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/Emulator.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_Emulator.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_Emulator.cpp$(DependSuffix): Source/UI/Emulator.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_Emulator.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_Emulator.cpp$(DependSuffix) -MM Source/UI/Emulator.cpp

./build-$(ConfigurationName)//Source_UI_Emulator.cpp$(PreprocessSuffix): Source/UI/Emulator.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_Emulator.cpp$(PreprocessSuffix) Source/UI/Emulator.cpp

./build-$(ConfigurationName)//Source_UI_Main.cpp$(ObjectSuffix): Source/UI/Main.cpp ./build-$(ConfigurationName)//Source_UI_Main.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/Main.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_Main.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_Main.cpp$(DependSuffix): Source/UI/Main.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_Main.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_Main.cpp$(DependSuffix) -MM Source/UI/Main.cpp

./build-$(ConfigurationName)//Source_UI_Main.cpp$(PreprocessSuffix): Source/UI/Main.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_Main.cpp$(PreprocessSuffix) Source/UI/Main.cpp

./build-$(ConfigurationName)//Source_UI_Devices_FDC.cpp$(ObjectSuffix): Source/UI/Devices/FDC.cpp ./build-$(ConfigurationName)//Source_UI_Devices_FDC.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/Devices/FDC.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_Devices_FDC.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_Devices_FDC.cpp$(DependSuffix): Source/UI/Devices/FDC.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_Devices_FDC.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_Devices_FDC.cpp$(DependSuffix) -MM Source/UI/Devices/FDC.cpp

./build-$(ConfigurationName)//Source_UI_Devices_FDC.cpp$(PreprocessSuffix): Source/UI/Devices/FDC.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_Devices_FDC.cpp$(PreprocessSuffix) Source/UI/Devices/FDC.cpp

./build-$(ConfigurationName)//Source_UI_AppWindows_SDLWindow.cpp$(ObjectSuffix): Source/UI/AppWindows/SDLWindow.cpp ./build-$(ConfigurationName)//Source_UI_AppWindows_SDLWindow.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/AppWindows/SDLWindow.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_AppWindows_SDLWindow.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_AppWindows_SDLWindow.cpp$(DependSuffix): Source/UI/AppWindows/SDLWindow.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_AppWindows_SDLWindow.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_AppWindows_SDLWindow.cpp$(DependSuffix) -MM Source/UI/AppWindows/SDLWindow.cpp

./build-$(ConfigurationName)//Source_UI_AppWindows_SDLWindow.cpp$(PreprocessSuffix): Source/UI/AppWindows/SDLWindow.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_AppWindows_SDLWindow.cpp$(PreprocessSuffix) Source/UI/AppWindows/SDLWindow.cpp

./build-$(ConfigurationName)//Source_UI_Utils_AmstradUtils.cpp$(ObjectSuffix): Source/UI/Utils/AmstradUtils.cpp ./build-$(ConfigurationName)//Source_UI_Utils_AmstradUtils.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/Utils/AmstradUtils.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_Utils_AmstradUtils.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_Utils_AmstradUtils.cpp$(DependSuffix): Source/UI/Utils/AmstradUtils.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_Utils_AmstradUtils.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_Utils_AmstradUtils.cpp$(DependSuffix) -MM Source/UI/Utils/AmstradUtils.cpp

./build-$(ConfigurationName)//Source_UI_Utils_AmstradUtils.cpp$(PreprocessSuffix): Source/UI/Utils/AmstradUtils.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_Utils_AmstradUtils.cpp$(PreprocessSuffix) Source/UI/Utils/AmstradUtils.cpp

./build-$(ConfigurationName)//Source_UI_Devices_ASIC.cpp$(ObjectSuffix): Source/UI/Devices/ASIC.cpp ./build-$(ConfigurationName)//Source_UI_Devices_ASIC.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/Devices/ASIC.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_Devices_ASIC.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_Devices_ASIC.cpp$(DependSuffix): Source/UI/Devices/ASIC.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_Devices_ASIC.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_Devices_ASIC.cpp$(DependSuffix) -MM Source/UI/Devices/ASIC.cpp

./build-$(ConfigurationName)//Source_UI_Devices_ASIC.cpp$(PreprocessSuffix): Source/UI/Devices/ASIC.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_Devices_ASIC.cpp$(PreprocessSuffix) Source/UI/Devices/ASIC.cpp

./build-$(ConfigurationName)//Source_UI_DataClasses_Config.cpp$(ObjectSuffix): Source/UI/DataClasses/Config.cpp ./build-$(ConfigurationName)//Source_UI_DataClasses_Config.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/DataClasses/Config.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_DataClasses_Config.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_DataClasses_Config.cpp$(DependSuffix): Source/UI/DataClasses/Config.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_DataClasses_Config.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_DataClasses_Config.cpp$(DependSuffix) -MM Source/UI/DataClasses/Config.cpp

./build-$(ConfigurationName)//Source_UI_DataClasses_Config.cpp$(PreprocessSuffix): Source/UI/DataClasses/Config.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_DataClasses_Config.cpp$(PreprocessSuffix) Source/UI/DataClasses/Config.cpp

./build-$(ConfigurationName)//Source_CPCEC_cpcec.c$(ObjectSuffix): Source/CPCEC/cpcec.c ./build-$(ConfigurationName)//Source_CPCEC_cpcec.c$(DependSuffix)
	$(CC) $(SourceSwitch) "$(WorkspacePath)/Source/CPCEC/cpcec.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_CPCEC_cpcec.c$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_CPCEC_cpcec.c$(DependSuffix): Source/CPCEC/cpcec.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_CPCEC_cpcec.c$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_CPCEC_cpcec.c$(DependSuffix) -MM Source/CPCEC/cpcec.c

./build-$(ConfigurationName)//Source_CPCEC_cpcec.c$(PreprocessSuffix): Source/CPCEC/cpcec.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_CPCEC_cpcec.c$(PreprocessSuffix) Source/CPCEC/cpcec.c

./build-$(ConfigurationName)//Source_UI_Devices_GateArray.cpp$(ObjectSuffix): Source/UI/Devices/GateArray.cpp ./build-$(ConfigurationName)//Source_UI_Devices_GateArray.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/Devices/GateArray.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_Devices_GateArray.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_Devices_GateArray.cpp$(DependSuffix): Source/UI/Devices/GateArray.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_Devices_GateArray.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_Devices_GateArray.cpp$(DependSuffix) -MM Source/UI/Devices/GateArray.cpp

./build-$(ConfigurationName)//Source_UI_Devices_GateArray.cpp$(PreprocessSuffix): Source/UI/Devices/GateArray.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_Devices_GateArray.cpp$(PreprocessSuffix) Source/UI/Devices/GateArray.cpp

./build-$(ConfigurationName)//Source_UI_Devices_Z80.cpp$(ObjectSuffix): Source/UI/Devices/Z80.cpp ./build-$(ConfigurationName)//Source_UI_Devices_Z80.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/Devices/Z80.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_Devices_Z80.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_Devices_Z80.cpp$(DependSuffix): Source/UI/Devices/Z80.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_Devices_Z80.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_Devices_Z80.cpp$(DependSuffix) -MM Source/UI/Devices/Z80.cpp

./build-$(ConfigurationName)//Source_UI_Devices_Z80.cpp$(PreprocessSuffix): Source/UI/Devices/Z80.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_Devices_Z80.cpp$(PreprocessSuffix) Source/UI/Devices/Z80.cpp

./build-$(ConfigurationName)//Source_UI_Utils_WindowPosSize.cpp$(ObjectSuffix): Source/UI/Utils/WindowPosSize.cpp ./build-$(ConfigurationName)//Source_UI_Utils_WindowPosSize.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/Utils/WindowPosSize.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_Utils_WindowPosSize.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_Utils_WindowPosSize.cpp$(DependSuffix): Source/UI/Utils/WindowPosSize.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_Utils_WindowPosSize.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_Utils_WindowPosSize.cpp$(DependSuffix) -MM Source/UI/Utils/WindowPosSize.cpp

./build-$(ConfigurationName)//Source_UI_Utils_WindowPosSize.cpp$(PreprocessSuffix): Source/UI/Utils/WindowPosSize.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_Utils_WindowPosSize.cpp$(PreprocessSuffix) Source/UI/Utils/WindowPosSize.cpp

./build-$(ConfigurationName)//Source_UI_ToolWindows_MemoryVizWindow.cpp$(ObjectSuffix): Source/UI/ToolWindows/MemoryVizWindow.cpp ./build-$(ConfigurationName)//Source_UI_ToolWindows_MemoryVizWindow.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/ToolWindows/MemoryVizWindow.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_ToolWindows_MemoryVizWindow.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_ToolWindows_MemoryVizWindow.cpp$(DependSuffix): Source/UI/ToolWindows/MemoryVizWindow.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_ToolWindows_MemoryVizWindow.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_ToolWindows_MemoryVizWindow.cpp$(DependSuffix) -MM Source/UI/ToolWindows/MemoryVizWindow.cpp

./build-$(ConfigurationName)//Source_UI_ToolWindows_MemoryVizWindow.cpp$(PreprocessSuffix): Source/UI/ToolWindows/MemoryVizWindow.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_ToolWindows_MemoryVizWindow.cpp$(PreprocessSuffix) Source/UI/ToolWindows/MemoryVizWindow.cpp

./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkList.cpp$(ObjectSuffix): Source/UI/GtkHelpers/GtkList.cpp ./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkList.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/GtkHelpers/GtkList.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_GtkHelpers_GtkList.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkList.cpp$(DependSuffix): Source/UI/GtkHelpers/GtkList.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkList.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkList.cpp$(DependSuffix) -MM Source/UI/GtkHelpers/GtkList.cpp

./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkList.cpp$(PreprocessSuffix): Source/UI/GtkHelpers/GtkList.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_GtkHelpers_GtkList.cpp$(PreprocessSuffix) Source/UI/GtkHelpers/GtkList.cpp

./build-$(ConfigurationName)//Source_UI_ToolWindows_ROMConfigWindow.cpp$(ObjectSuffix): Source/UI/ToolWindows/ROMConfigWindow.cpp ./build-$(ConfigurationName)//Source_UI_ToolWindows_ROMConfigWindow.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/ToolWindows/ROMConfigWindow.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_ToolWindows_ROMConfigWindow.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_ToolWindows_ROMConfigWindow.cpp$(DependSuffix): Source/UI/ToolWindows/ROMConfigWindow.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_ToolWindows_ROMConfigWindow.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_ToolWindows_ROMConfigWindow.cpp$(DependSuffix) -MM Source/UI/ToolWindows/ROMConfigWindow.cpp

./build-$(ConfigurationName)//Source_UI_ToolWindows_ROMConfigWindow.cpp$(PreprocessSuffix): Source/UI/ToolWindows/ROMConfigWindow.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_ToolWindows_ROMConfigWindow.cpp$(PreprocessSuffix) Source/UI/ToolWindows/ROMConfigWindow.cpp

./build-$(ConfigurationName)//Source_UI_AppWindows_ToolWindow.cpp$(ObjectSuffix): Source/UI/AppWindows/ToolWindow.cpp ./build-$(ConfigurationName)//Source_UI_AppWindows_ToolWindow.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/AppWindows/ToolWindow.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_AppWindows_ToolWindow.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_AppWindows_ToolWindow.cpp$(DependSuffix): Source/UI/AppWindows/ToolWindow.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_AppWindows_ToolWindow.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_AppWindows_ToolWindow.cpp$(DependSuffix) -MM Source/UI/AppWindows/ToolWindow.cpp

./build-$(ConfigurationName)//Source_UI_AppWindows_ToolWindow.cpp$(PreprocessSuffix): Source/UI/AppWindows/ToolWindow.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_AppWindows_ToolWindow.cpp$(PreprocessSuffix) Source/UI/AppWindows/ToolWindow.cpp

./build-$(ConfigurationName)//Source_UI_ToolWindows_SymbolsWindow.cpp$(ObjectSuffix): Source/UI/ToolWindows/SymbolsWindow.cpp ./build-$(ConfigurationName)//Source_UI_ToolWindows_SymbolsWindow.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "$(WorkspacePath)/Source/UI/ToolWindows/SymbolsWindow.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Source_UI_ToolWindows_SymbolsWindow.cpp$(ObjectSuffix) $(IncludePath)
./build-$(ConfigurationName)//Source_UI_ToolWindows_SymbolsWindow.cpp$(DependSuffix): Source/UI/ToolWindows/SymbolsWindow.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT./build-$(ConfigurationName)//Source_UI_ToolWindows_SymbolsWindow.cpp$(ObjectSuffix) -MF./build-$(ConfigurationName)//Source_UI_ToolWindows_SymbolsWindow.cpp$(DependSuffix) -MM Source/UI/ToolWindows/SymbolsWindow.cpp

./build-$(ConfigurationName)//Source_UI_ToolWindows_SymbolsWindow.cpp$(PreprocessSuffix): Source/UI/ToolWindows/SymbolsWindow.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) ./build-$(ConfigurationName)//Source_UI_ToolWindows_SymbolsWindow.cpp$(PreprocessSuffix) Source/UI/ToolWindows/SymbolsWindow.cpp


-include ./build-$(ConfigurationName)///*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r $(IntermediateDirectory)


