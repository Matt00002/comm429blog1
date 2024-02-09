# New Project Directory Bash Script

To avoid the repeated inconvience of making a new directory for each new project I start, I created a bash script that uses the command line to do it for me.

To use the script, first place the file in the directory you wish to create your project.

Next open the command line and enter:

	bash create-project.sh

You can also provide a name for the project as an input like this:

	bash create-project.sh cool-project-name

## What the script does

After running the script, a directory will be created, structured like so:

- new-project
	- site
		- pages
		- posts
		- comments
	- assets
		- images
		- styles
		- scripts

If a project name was provided, the project folder will be named as such, otherwise it will be named 'new-project'.

There will also be the following files that contain some boilerplate code.

- index.html
- style.css
- main.js

The script will also open all of the files it created to help get you started.

## Looking inside the script

The script first checks if any arguments were provided to it with this if statement:

	if [ $# != 0 ]; then
		NAME=$1
	else
		NAME="new-project"
	fi

If there was an argument, then the NAME variable will be set to whatever it was, otherwise it will be set to 'new-project'

Next, I create all of the new directories, starting with a folder named by the NAME variable:

	mkdir $NAME
	cd $NAME
	mkdir assets site
	cd site
	mkdir pages posts comments
	cd ..
	cd assets
	mkdir images scripts styles
	cd ..

I use mkdir to create directories, while I use cd to change the directory to the one I want to work in.

After that, I use the touch command to create each of the template files:

	touch index.html
	touch assets/styles/style.css
	touch assets/scripts/main.js

Next I use the echo command to insert boilerplate code into each file, line by line:

	echo "<!DOCTYPE html>" >> index.html
	echo "<html>" >> index.html
	echo "	<head>" >> index.html
	echo "		<meta charset=\"utf-8\">" >> index.html
	echo "		<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">" >> index.html
	echo "		<link rel=\"stylesheet\" href=\"assets/styles/style.css\">" >> index.html
	echo "	</head>" >> index.html
	echo "	<body>" >> index.html
	echo "		<h1>If this is red, the css is working.</h1>" >> index.html
	echo "		<h2 id=\"js\">If this is blue, the js is working.</h1>" >> index.html
	echo "		<script src=\"assets/scripts/main.js\"></script>" >> index.html
	echo "	</body>" >> index.html
	echo "</html>" >> index.html
	echo "h1 {color:red;}" >> assets/styles/style.css
	echo "document.getElementById('js').style.color = 'blue';" >> assets/scripts/main.js

Finally, I use xdg-open to open each of the template files:

	xdg-open index.html
	xdg-open assets/scripts/main.js
	xdg-open assets/styles/style.css

xdg-open opens the files in their default applications.

## What I learned

In making this script, I learned how I can better utilize the command line to do simple tasks significantly faster.

In the future I could use this knowledge to make other scripts, such as a script to help create back-up versions of important files.