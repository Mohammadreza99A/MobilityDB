# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_COMMAND = /home/mohamed/clion-2018.1/bin/cmake/bin/cmake

# The command to remove a file.
RM = /home/mohamed/clion-2018.1/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/mohamed/MobilityDB_git/stats

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mohamed/MobilityDB_git/stats/cmake-build-debug

# Utility rule file for control.

# Include the progress variables for this target.
include CMakeFiles/control.dir/progress.make

CMakeFiles/control: mobilitydb.control


mobilitydb.control: ../control.in
mobilitydb.control: ../point/control.in
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/mohamed/MobilityDB_git/stats/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating mobilitydb.control"
	cd /home/mohamed/MobilityDB_git/stats && cat control.in point/control.in | sed -e's/LIBNAME/MobilityDB/' > /home/mohamed/MobilityDB_git/stats/cmake-build-debug/mobilitydb.control

control: CMakeFiles/control
control: mobilitydb.control
control: CMakeFiles/control.dir/build.make

.PHONY : control

# Rule to build all files generated by this target.
CMakeFiles/control.dir/build: control

.PHONY : CMakeFiles/control.dir/build

CMakeFiles/control.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/control.dir/cmake_clean.cmake
.PHONY : CMakeFiles/control.dir/clean

CMakeFiles/control.dir/depend:
	cd /home/mohamed/MobilityDB_git/stats/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mohamed/MobilityDB_git/stats /home/mohamed/MobilityDB_git/stats /home/mohamed/MobilityDB_git/stats/cmake-build-debug /home/mohamed/MobilityDB_git/stats/cmake-build-debug /home/mohamed/MobilityDB_git/stats/cmake-build-debug/CMakeFiles/control.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/control.dir/depend

