
# Single Variables

# values with comma separators
# paste into console directly

78, 77, 76, 81, 85, 51, 79, 82, 84, 98

cb <- c( 78, 77, 76, 81, 85, 51, 79, 82, 84, 98 )


# With different separators (; or space)
# open a new R script
# find ";" replace ","

179; 204; 211; 211; 232; 205; 185; 185; 178; 210; 206; 212; 184; 174;
185; 242; 188; 212; 215; 247; 241; 223; 220; 260; 245; 259; 278; 270;
280; 295; 275; 285; 290; 272; 273; 280; 285; 286; 200; 215; 185; 230;
250; 241; 190; 260; 250; 302; 265; 290; 276; 228; 265





cb <- c(179, 204, 211, 211, 232, 205, 185, 185, 178, 210, 206, 212, 184, 174, 185, 242, 188, 212, 215, 247, 241, 223, 220, 260, 245, 259, 278, 270, 280, 295, 275, 285, 290, 272, 273, 280, 285, 286, 200, 215, 185, 230, 250, 241, 190, 260, 250, 302, 265, 290, 276, 228, 265)



# Tables: more tricky
# https://en.wikipedia.org/wiki/Table_(information)

# windows
read.table("clipboard", header=T)

# mac
read.table(pipe("pbpaste"), header=T)



# clipr
# better than direct
install.packages("clipr")
library("clipr")

# read from datatables
read_clip_tbl()



# data pasta

install.packages("datapasta")
library(datapasta)
# read this
https://r-journalism.com/posts/2018-06-07-datapasta/datapasta/


# Try
https://www.msn.com/en-us/sports/nfl







