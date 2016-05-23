#!/bin/sh
cd /data5/svn-to-git/git-repo/
for i in *; do
	if [[ -d "$i/.git" ]]; then
		cd "$i"
		git gc
		if [[ -d "$i/.git/svn" ]]; then
			git svn gc
		fi
		cd ..
	fi
done
cd /data5/svn-to-git/git-svn-scripts
/bin/sh ./git_svn_up.sh
