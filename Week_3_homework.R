surveys <- read.csv("data/portal_data_joined.csv")

str(surveys)

surveys[1,5]
surveys[1:5] 

#tested to figure out if selection works

surveys_base <- surveys[1:5000, c("species_id", "weight", "plot_type")] 
 
#selected which rows were needed, and specified which columns we wanted

surveys_base <- surveys_base[complete.cases(surveys_base), ]

surveys_base

surveys_base$species_id <- factor(surveys_base$species_id)
surveys_base

surveys_base$plot_type <- factor(surveys_base$plot_type)
surveys_base

class(surveys_base$plot_type)

#I'm not sure why we might want to use factors over characters

challenge_base <- surveys_base[surveys_base[, 2] >150, ]
