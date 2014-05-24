# Creates hard links to all the files. All the links are in the same 
# directories as the files only one level higher in the file hierarchy. 
# If creates destination folder if it doesn't exist. If file already exists 
# then link is not created. Only thing that needs to be done manualy is 
# create file .bashrc in home directory if it doesent exist, and paste 
# into it this lines :
# if [ -f ~/.bash_aliases ]; then
#	. ~/.bash_aliases
# fi

function createLink {
	file="$2"
	fullPath="$directory"/"$file"

	# Create directory if it doesent exist.
	if [ ! -d "$directory" ]; then
		mkdir "$directory"
	fi

	# Create link if file doesn't exist
	if [[ ! -f "$fullPath" ]]; then
		ln "$file"  "$fullPath"
	fi
}

createLink ~ .bashrc
createLink ~ .bash_aliases
createLink ~ .Xmodmapus
createLink ~ .Xmodmapsi

(cd .nrss 
createLink ~/.nrss config)
(cd Desktop 
createLink ~/Desktop HUDI\ TERMINAL\ UKAZI
createLink ~/Desktop NYK)
  
