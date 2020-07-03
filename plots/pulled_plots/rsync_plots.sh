# Pull plots over from the git repos

cat filelist.txt | xargs -I'{}' rsync -av '{}' .
