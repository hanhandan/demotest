# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/vincent/samba/github/demotest/C

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/vincent/samba/github/demotest/C/bin

# Include any dependencies generated for this target.
include fileop/CMakeFiles/libfileop.dir/depend.make

# Include the progress variables for this target.
include fileop/CMakeFiles/libfileop.dir/progress.make

# Include the compile flags for this target's objects.
include fileop/CMakeFiles/libfileop.dir/flags.make

fileop/CMakeFiles/libfileop.dir/remove_dir.c.o: fileop/CMakeFiles/libfileop.dir/flags.make
fileop/CMakeFiles/libfileop.dir/remove_dir.c.o: ../fileop/remove_dir.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/vincent/samba/github/demotest/C/bin/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object fileop/CMakeFiles/libfileop.dir/remove_dir.c.o"
	cd /home/vincent/samba/github/demotest/C/bin/fileop && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/libfileop.dir/remove_dir.c.o   -c /home/vincent/samba/github/demotest/C/fileop/remove_dir.c

fileop/CMakeFiles/libfileop.dir/remove_dir.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libfileop.dir/remove_dir.c.i"
	cd /home/vincent/samba/github/demotest/C/bin/fileop && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/vincent/samba/github/demotest/C/fileop/remove_dir.c > CMakeFiles/libfileop.dir/remove_dir.c.i

fileop/CMakeFiles/libfileop.dir/remove_dir.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libfileop.dir/remove_dir.c.s"
	cd /home/vincent/samba/github/demotest/C/bin/fileop && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/vincent/samba/github/demotest/C/fileop/remove_dir.c -o CMakeFiles/libfileop.dir/remove_dir.c.s

fileop/CMakeFiles/libfileop.dir/remove_dir.c.o.requires:
.PHONY : fileop/CMakeFiles/libfileop.dir/remove_dir.c.o.requires

fileop/CMakeFiles/libfileop.dir/remove_dir.c.o.provides: fileop/CMakeFiles/libfileop.dir/remove_dir.c.o.requires
	$(MAKE) -f fileop/CMakeFiles/libfileop.dir/build.make fileop/CMakeFiles/libfileop.dir/remove_dir.c.o.provides.build
.PHONY : fileop/CMakeFiles/libfileop.dir/remove_dir.c.o.provides

fileop/CMakeFiles/libfileop.dir/remove_dir.c.o.provides.build: fileop/CMakeFiles/libfileop.dir/remove_dir.c.o

# Object files for target libfileop
libfileop_OBJECTS = \
"CMakeFiles/libfileop.dir/remove_dir.c.o"

# External object files for target libfileop
libfileop_EXTERNAL_OBJECTS =

lib/liblibfileop.a: fileop/CMakeFiles/libfileop.dir/remove_dir.c.o
lib/liblibfileop.a: fileop/CMakeFiles/libfileop.dir/build.make
lib/liblibfileop.a: fileop/CMakeFiles/libfileop.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C static library ../lib/liblibfileop.a"
	cd /home/vincent/samba/github/demotest/C/bin/fileop && $(CMAKE_COMMAND) -P CMakeFiles/libfileop.dir/cmake_clean_target.cmake
	cd /home/vincent/samba/github/demotest/C/bin/fileop && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/libfileop.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
fileop/CMakeFiles/libfileop.dir/build: lib/liblibfileop.a
.PHONY : fileop/CMakeFiles/libfileop.dir/build

fileop/CMakeFiles/libfileop.dir/requires: fileop/CMakeFiles/libfileop.dir/remove_dir.c.o.requires
.PHONY : fileop/CMakeFiles/libfileop.dir/requires

fileop/CMakeFiles/libfileop.dir/clean:
	cd /home/vincent/samba/github/demotest/C/bin/fileop && $(CMAKE_COMMAND) -P CMakeFiles/libfileop.dir/cmake_clean.cmake
.PHONY : fileop/CMakeFiles/libfileop.dir/clean

fileop/CMakeFiles/libfileop.dir/depend:
	cd /home/vincent/samba/github/demotest/C/bin && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/vincent/samba/github/demotest/C /home/vincent/samba/github/demotest/C/fileop /home/vincent/samba/github/demotest/C/bin /home/vincent/samba/github/demotest/C/bin/fileop /home/vincent/samba/github/demotest/C/bin/fileop/CMakeFiles/libfileop.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : fileop/CMakeFiles/libfileop.dir/depend

