#!/bin/bash
cd ~/code
time=$(date "+%Y-%m-%d %H:%M:%S")
echo "##################${time} Begin Sync Code#######################"  >> syncLog.txt 2>&1
##t2306
cd leetcode
leetcode_branch_name=`git symbolic-ref --short -q HEAD`
echo "###leetcode's current branch is ${leetcode_branch_name}###" >> ../syncLog.txt 2>&1
git checkout master >> ../syncLog.txt 2>&1
git fetch origin >> ../syncLog.txt 2>&1
git rebase origin/master >> ../syncLog.txt 2>&1
git push >> ../syncLog.txt 2>&1
git checkout $leetcode_branch_name >> ../syncLog.txt 2>&1
git rebase master >> ../syncLog.txt 2>&1
git push >> ../syncLog.txt 2>&1
