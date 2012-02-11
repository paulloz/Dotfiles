function extract ()
{
  if [ $# -eq 0 ] ; then
    echo "You must specify input file..." >> /dev/stderr
  else
    for file in $@ ; do
      if [ -f $file ] ; then
	tempdir=$(echo $file | sed 's/\..\{3\}$//')
	mkdir -p "$tempdir"
	cp "$file" "$tempdir"
	cd "$tempdir"
	case "$file" in
	    *.zip)		unzip	    $file;;
	    *.tar)		tar xvf	    $file;;
	    *.tar.bz2 | *.tbz2) tar xjvf    $file;;
	    *.tar.gz | *.tgz)   tar xzvf    $file;;
	    *.bz2)		bunzip2	    $file;;
	    *.rar)		unrar x	    $file;;
	    *.gz)		gunzip	    $file;;
	    *.Z)		uncompress  $file;;
	    *.7z)		7z x	    $file;;
	    *.xz)		tar xJvf    $file;;
	    *)			echo "$file cannot be extracted" >> /dev/stderr;;
	esac
	rm -f $file
	filecount=$(($(ls -l | wc -l) - 1))
	if [ $filecount -lt 2 ] ; then
	  for f in * ; do
	    mv "$f" "../"
	  done
	fi
	cd "../"
	if [ $filecount -lt 2 ] ; then
	  rmdir "$tempdir"
	fi
      else
	echo "$file : file not found." >> /dev/stderr
      fi
    done
  fi
}
