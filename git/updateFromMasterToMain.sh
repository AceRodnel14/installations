git branch -m master main
git fetch origin
git branch -u origin/main main
git remote set-head origin -a



# This is used when a file is accidentally deleted
git checkout -f HEAD
git pull