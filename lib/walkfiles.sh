# recursivly print all paths of files not in .ignore
walkfiles(){
  for file in $(ls -Rd $1/*);do
    if [ -d "$file" ]; then
      #if [ -f "$PWD/.ignore" ]; then 
        ignoreDir $file
      #else
        #walkfiles $file
      #fi
    else 
      #if [ -f "$PWD/.ignore" ]; then 
        ignoreFile $file
      #else
        #[ $(ignoreInput) = "no" ] && echo $file
      #fi
    fi
  done
}
