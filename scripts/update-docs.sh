#!/bin/sh

rm -rfv docs
git clone -b gh-pages --single-branch git@github.com:bcylin/QuickTableViewController.git docs

bundle exec jazzy --config .jazzy.yaml


files=(html css js json)

for file in "${files[@]}"
do
  echo "Cleaning whitespace in *.$file"
  find docs/output -name "*."$file -exec sed -E -i '' -e 's/[[:blank:]]*$//' {} \;
done


cd docs && pwd
git checkout gh-pages
git status
git --no-pager show
cp -rfv output/* .
git add .
git commit -m "[CI] Update documentation at $(date +'%Y-%m-%d %H:%M:%S %z')"
ruby ../scripts/push-gh-pages.rb
cd -
