# DESCRIPTION
# overwrites ~/palettesRootDir.txt with the absolute path to the /palettes directory of this repository. (Creates that file if it does not exist.) The path in that file is read by and used by various scripts in the _ebDev if not other repositories.

# USAGE
# With this script in your PATH, run it:
# ./createPalettesRootDirTXT.sh


# CODE
# for calling this script from anywhere if it is in the PATH; get full path to script minus file name:
fullPathToScript=$0
palettesRepoBasePath="${fullPathToScript%\/*}"
printf "$palettesRepoBasePath"/palettes > ~/palettesRootDir.txt