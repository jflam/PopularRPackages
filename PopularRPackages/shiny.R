# Shiny Hello, World (from http://shiny.rstudio.com/tutorial/lesson1/)

# It's cool that they have examples built into the package itself
library(shiny)
runExample("01_hello")

# See the directory shiny_1 and the ui.R and server.R files 
runApp("shiny_1")

# Here are the other built-in examples for Shiny
# TODO: why can't we run these examples one after each other?
# TODO: how does RStudio handle this scenario?
runExample("02_text") # tables and data frames
runExample("03_reactivity") # a reactive expression
runExample("04_mpg") # global variables
runExample("05_sliders") # slider bars
runExample("06_tabsets") # tabbed panels
runExample("07_widgets") # help text and submit buttons
runExample("08_html") # Shiny app built from HTML
runExample("09_upload") # file upload wizard
runExample("10_download") # file download wizard
runExample("11_timer") # an automated timer