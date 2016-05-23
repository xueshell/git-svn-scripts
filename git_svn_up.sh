#!/bin/bash
cd /data5/svn-to-git/git-repo
for i in *; do
	if [[ -d "$i/.git" && -d "$i/.git/svn" ]]; then
		echo "Updating GIT repository $i"
		cd "$i"
		if [[ $(git status --porcelain | wc -l) -eq 0 ]]; then
			git svn rebase --fetch-all && git svn dcommit
            git push origin master
		else
			echo "GIT repository $i has uncommited content"
		fi
		cd ..
	fi
done


