library(tidyverse)
library(forcats)

mc_questions <- read_csv("./Data/multiple_choice_responses.csv")
questions_only <- read_csv("./Data/questions_only.csv")
txt_responses <- read_csv("./Data/other_text_responses.csv")


#DATA MUNGING
mc_questions <- filter(mc_questions,!is.na(Q5) & Q5 != "Other") %>% .[-1,]

#EVALUATE VARIOUS ROWS
plot <- ggplot(mc_questions, aes(fct_rev(fct_infreq(Q5))), fill=rownames(mc_questions)) + 
                          geom_bar()  +
                          coord_flip() 


                          