# DESCRIPTION
# overwrites ~/palettesRootDir.txt (used by randomHorizontalColorLines and other
# scripts) with a list of the full path to all subdirectories in the palettes
# directory of this repository.

# USAGE
# FROM THE DIRECTORY with this script, run it (from a terminal):
# ./createPalettesRootDirTXT.sh


# CODE
currdir=`pwd`
printf "$currdir"/palettes > ~/palettesRootDir.txt

# mislead, deprecated effort:
# cd palettes
	# the gsed and tr commands cut off the ./ and windows newlines on cygwin:
	# directories_list=`gfind . -type d | gsed 's/\.\///g' | tr -d '\15\32' | sort -n`
# gfind . -type d | gsed 's/\.\///g' | tr -d '\15\32' | sort -n > ~/ef7M2dRP_swap_tmp_palettesRootDir.txt
	# trim off the first line:
# tail -n +2 ~/ef7M2dRP_swap_tmp_palettesRootDir.txt > ~/palettesRootDir.txt
# rm ~/ef7M2dRP_swap_tmp_palettesRootDir.txt