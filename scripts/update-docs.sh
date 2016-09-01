#!/bin/sh

files=(html css js json)

for file in "${files[@]}"
do
  echo "Cleaning whitespace in *.$file"
  find docs/output -name "*."$file -exec sed -E -i '' -e 's/[[:blank:]]*$//' {} \;
done

cd docs
git pull --ff-only origin gh-pages
cp -rfv output/* .
git add .
git commit -m "[CI] Update documentation at $(date +'%Y-%m-%d %H:%M:%S %z')"
git push origin gh-pages
cd -
