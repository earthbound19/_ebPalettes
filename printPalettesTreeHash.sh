# DESCRIPTION
# For usage with `printContentsOfRandomPalette_GitHubAPI.sh` (in _ebDev repository). Prints the SHA_TREE hash of the /palettes subdirectory, for use in retrieving palette file names and contents via API.

# USAGE
# Run without any parameters:
#    printPalettesTreeHash.sh

currentBranchName=$(git branch --show-current)
if [ "$currentBranchName" == "master" ]
then
	git rev-parse HEAD:palettes
else
	echo "PROBLEM: current branch name for reference is not master. Stash or commit and push any changes to the current branch, then checkout master."
fi