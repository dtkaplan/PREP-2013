# set up the style sheet for files in subdirectories

# source this into the R session BEFORE compiling Rmd -> html
options(markdown.HTML.stylesheet = '../../stylesheets/prep2013.css')
options(rstudio.markdownToHTML =
          function(inputFile, outputFile) {     
            require(markdown)
            markdownToHTML(inputFile, outputFile, stylesheet='../../stylesheets/prep2013.css')  
          }
)