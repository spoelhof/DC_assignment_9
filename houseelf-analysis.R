# This script performs a genetic analysis of house elf ear length.
library(stringr)

#import data
elf = read.csv("data/houseelf-earlength-dna-data-1.csv", header = T, stringsAsFactors = F)

# Fun. to calculate GC-content (%)
get_gc_content = function(sequence){
  Gs <- str_count(tolower(sequence), "g")
  Cs <- str_count(tolower(sequence), "c")
  gc_content <- (Gs + Cs)*100 / str_length(sequence) 
  return(gc_content)
}

get_ear_length <- function(seq){
   #Calculate the GC-content for one or more sequences
   ear_lengths <- ifelse(seq > 10, "large", "small")
   return(ear_lengths)
}

#calculate GC and append to dataset as 'GC'
(elf$GC = get_gc_content(elf$dnaseq))
