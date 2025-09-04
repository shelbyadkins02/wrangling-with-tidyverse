#MES 565 week 3
#Shelby Adkins

#########################################################################
library(readxl)
library(tidyverse)
library(dplyr)
sites <- read_excel("data/sttstj_all_sites.xlsx", sheet = "locations")
# after importing sheet add , after quotation and press tab, select sheet = and quote sheet name that you want

# control, shift, m = pipe symbol

# view(sites)

# 1) What is the data structure and type of data? 
glimpse(sites)
# integer, numeric, character

# 2) How many samples are in the data set? 
nrow(sites)
# 2,505

# 3) How many unique habitat types are there? What are the names of each habitat? 

# sites$hab shows every single habitat entry
unique(sites$hab) 
# OR sites %>% distinct(hab)

# "PVMT" "AGRF" "SCR"  "PTRF" "BDRK" "HARD"

# 4) How many sites are there in the "PVMT" habitat type? 
sites %>% filter(hab == "PVMT") %>% nrow() 

# 5) How many sites are there in the pvmt and agrf habitat types 
# use | to repeat same function as pvmt for agrf so you get total for sum of both 
sites %>% filter(hab == "PVMT"|hab == "AGRF") %>% nrow() 

# 6) how many sites are there in all habitat types except "PVMT" ?
sites %>% filter(hab != "PVMT") %>% nrow()

# 1934

# 7) Show first five records of AGRF or SCR and only show yr_site and hab columns
# head(sites %>% filter(hab == "AGRF"| hab == "SCR")

# only show the "yr_site =" and "hab" columns
# %>% select ("yr_site", "hab"))

head(sites %>% filter(hab == "AGRF"| hab == "SCR")  %>% select ("yr_site", "hab"))

# 8) what is the northern most site sampled in the "BDRK" habitat?
sites %>% filter(hab == "BDRK") %>% arrange(desc(lat)) %>% slice(1)

#2019_5450

# 9) What is the western most site sampled 
sites %>% filter(hab == "AGRF"|hab == "SCR") %>% arrange(lon) %>% slice(1)

#2015_9758

# 10) How many years were surveyed in the data set? 
unique(sites$year)


# 11) What is the eastern most site sample in the agrf habitat in 2004 
sites %>% filter(hab == "AGRF" & year == "2004") %>% arrange(desc(lon)) %>% slice(1)

#2004_1821