wat
**/gulpfile.js**  
``` js  
'use strict';

const gulp = require('gulp');
const run = require('gulp-run');

const paths = ['lib/**/*.sh', 'main.sh'];

gulp.task('render', function(){
  console.log('first');
  run('./render.sh').exec()
});

gulp.task('watch', function(){
  gulp.watch(paths, ['build']);
});

gulp.task('build', ['render']);
gulp.task('default', ['build']);
```  
##/lib  
wat
**/lib/file-to-markdown.sh**  
``` sh  
dirNameMarkdown(){ 
  file=$1
  echo "##$file  " 
}

fileNameMarkdown(){
  file=$1
  echo "**$file**  "
}

codeBlockMarkdown(){
  file=$1
  fileExtension=$2
  echo "\`\`\` $fileExtension  "
  cat ".$file"
  echo "\`\`\`  "
}

imageMarkdown(){
  file=$1
  echo "![]($file)  "
}

markdownMarkdown(){
  file=$1 
  cat ".$file"
}
```  
wat
**/lib/generate-markdown.sh**  
``` sh  
generateMarkdown(){
  for file in $(walkfiles $PWD); do
    fileExtnesion=$(getFileExtension $file)
    relitiveFilePath=$(getRelitivePath $file)
    if [ -d $file ];then 
      dirNameMarkdown "$relitiveFilePath"
    else 
      renderMarkdownForFile "$relitiveFilePath" "$fileExtnesion"
    fi
  done
}
```  
wat
**/lib/get-file-extension.sh**  
``` sh  
getFileExtension(){
  file="$1"
  fileBaseName=$(basename $file)
  fileExtension=$(echo $fileBaseName |cut -d '.' -f 2)
  echo "$fileExtension" 
}
```  
wat
**/lib/get-relitive-path.sh**  
``` sh  
getRelitivePath(){
  absolutePath="$1"
  pwdLength="${#PWD}"
  echo "${absolutePath:$pwdLength}"
}
```  
wat
**/lib/ignore-dir.sh**  
``` sh  
ignoreDir(){
  file="$1"
  fileMatchesIgnoreCase="no"

  for ignore in $(cat .ignore);do
    if [ $(basename "$file") = "$ignore" ];then  
      fileMatchesIgnoreCase='yes'
      continue
    fi
  done

  if [ $fileMatchesIgnoreCase = "no" ];then
    echo $file
    walkfiles $file
  fi
}
```  
wat
**/lib/ignore-file.sh**  
``` sh  
ignoreFile(){
  file="$1"
  fileMatchesIgnoreCase="no"

  for ignore in $(cat "$PWD/.ignore");do
    if [ $(basename "$file") = "$ignore" ];then  
      fileMatchesIgnoreCase="yes"
      continue
    fi
  done

  [ $fileMatchesIgnoreCase = "no" ] && echo $file 
}
```  
wat
**/lib/render-markdown-for-file.sh**  
``` sh  
renderMarkdownForFile(){
  relitiveFilePath="$1"
  fileExtnesion="$2"
  echo "wat"
  case $fileExtnesion in
    *"md"*)
      fileNameMarkdown "$relitiveFilePath"
      markdownMarkdown "$relitiveFilePath";;
    *"sh"*)
      fileNameMarkdown "$relitiveFilePath"
      codeBlockMarkdown "$relitiveFilePath" "$fileExtnesion";;
    *"js"*)
      fileNameMarkdown "$relitiveFilePath"
      codeBlockMarkdown "$relitiveFilePath" "$fileExtnesion";;
    *"py"*)
      fileNameMarkdown "$relitiveFilePath"
      codeBlockMarkdown "$relitiveFilePath" "$fileExtnesion";;
    *"html"*)
      fileNameMarkdown "$relitiveFilePath"
      codeBlockMarkdown "$relitiveFilePath" "$fileExtnesion";;
    *"css"*)
      fileNameMarkdown "$relitiveFilePath"
      codeBlockMarkdown "$relitiveFilePath" "$fileExtnesion";;
    *"jsx"*)
      fileNameMarkdown "$relitiveFilePath"
      codeBlockMarkdown "$relitiveFilePath" "$fileExtnesion";;
    *"scss"*)
      fileNameMarkdown "$relitiveFilePath"
      codeBlockMarkdown "$relitiveFilePath" "$fileExtnesion";;
    *"sass"*)
      fileNameMarkdown "$relitiveFilePath"
      codeBlockMarkdown "$relitiveFilePath" "$fileExtnesion";;
    *"png"*)
      fileNameMarkdown "$relitiveFilePath"
      imageMarkdown "$relitiveFilePath";;
    *"jpg"*)
      fileNameMarkdown "$relitiveFilePath"
      imageMarkdown "$relitiveFilePath";;
    *"gif"*)
      fileNameMarkdown "$relitiveFilePath"
      imageMarkdown "$relitiveFilePath";;
    *"tif"*)
      fileNameMarkdown "$relitiveFilePath"
      imageMarkdown "$relitiveFilePath";;
    *"bmp"*)
      fileNameMarkdown "$relitiveFilePath"
      imageMarkdown "$relitiveFilePath";;
    *)
      fileNameMarkdown "$relitiveFilePath"

    esac
}
```  
wat
**/lib/walkfiles.sh**  
``` sh  
# recursivly print all paths of files not in .ignore
walkfiles(){
  for file in $(ls -Rd $1/*);do
    if [ -d "$file" ]; then
      if [ -f "$PWD/.ignore" ]; then 
        ignoreDir $file
      else
        walkfiles $file
      fi
    else 
      if [ -f "$PWD/.ignore" ]; then 
        ignoreFile $file
      else
        echo $file
      fi
    fi
  done
}
```  
##/lul  
wat
**/lul/fog**  
##/lul/wat  
##/lul/wat/grr  
wat
**/lul/wat/grr/about.md**  
# wat is up
* oh nothing
* just tesing out stuff
[this links back to here](/)
wat
**/lul/wat/grr/ok**  
wat
**/lul/wat/grr/yess**  
wat
**/lul/wat/hello**  
wat
**/lul/wort**  
wat
**/lulwat.png**  
![](/lulwat.png)  
wat
**/main.sh**  
``` sh  
generateMarkdown
```  
wat
**/makefile**  
wat
**/markdownify**  
wat
**/package.json**  
``` json  
{
  "name": "markdownify",
  "version": "1.0.0",
  "description": "pisssss off tyler",
  "main": "none",
  "scripts": {
    "test": "make"
  },
  "repository": {
    "type": "git",
    "url": "git+https://github.com/slugbyte/markdownify.git"
  },
  "keywords": [
    "'lulz'"
  ],
  "author": "slugbyte",
  "license": "ISC",
  "bugs": {
    "url": "https://github.com/slugbyte/markdownify/issues"
  },
  "homepage": "https://github.com/slugbyte/markdownify#readme",
  "devDependencies": {
    "gulp": "^3.9.1",
    "gulp-run": "^1.6.12"
  }
}
```  
wat
**/render.sh**  
``` sh  
#!/bin/bash 
include(){
  cat $1 >> markdownify
  echo >> markdownify
}

setup(){
  rm markdownify
  echo "#!/bin/bash" > markdownify
  chmod 755 markdownify
}

setup
include "./lib/get-relitive-path.sh"
include "./lib/get-file-extension.sh"
include "./lib/ignore-dir.sh"
include "./lib/ignore-file.sh"
include "./lib/walkfiles.sh"
include "./lib/file-to-markdown.sh"
include "./lib/render-markdown-for-file.sh"
include "./lib/generate-markdown.sh"
include "./main.sh"
```  
wat
**/wat**  
