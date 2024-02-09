#!/bin/bash
#---- this script scaffolds a simple project directory

if [ $# != 0 ]; then
	NAME=$1
else
	NAME="new-project"
fi

mkdir $NAME
cd $NAME
mkdir assets site
cd site
mkdir pages posts comments
cd ..
cd assets
mkdir images scripts styles
cd ..
touch index.html
touch assets/styles/style.css
touch assets/scripts/main.js
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
xdg-open index.html
xdg-open assets/scripts/main.js
xdg-open assets/styles/style.css
