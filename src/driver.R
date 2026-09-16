#Create the directory structure
if (!file.exists('data')) dir.create('data') # if the file does not exist, create it 
if (!file.exists('src')) dir.create('src')
if (!file.exists('results')) dir.create('results')
if (!file.exists('docs')) dir.create('docs')

#tell our driver to run “EditDataframe.R”.
source('src/EditDataframe.R')

source('src/Analysis.R')
