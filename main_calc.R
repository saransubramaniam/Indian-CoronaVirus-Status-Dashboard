library(dplyr)
library(magrittr)
confirmed_color <- "purple"
active_color <- "#1f77b4"
recovered_color <- "forestgreen"
death_color <- "red"
data_set1=NULL
# data_set1 <- read.csv("https://api.covid19india.org/csv/latest/states.csv",
#                       stringsAsFactors =FALSE)%>%
#             dplyr::mutate(
#                      State = trimws(State),
#                      State = factor(State, levels = unique(State)))
Data <- read.csv("https://api.covid19india.org/csv/latest/states.csv",stringsAsFactors =FALSE)%>%
  dplyr::mutate(
    State = trimws(State),
    State = factor(State, levels = unique(State))
  )

data_set2<-read.csv("https://api.covid19india.org/csv/latest/state_wise.csv",
                    stringsAsFactors = FALSE)

data_state_daily<-read.csv("https://api.covid19india.org/csv/latest/state_wise_daily.csv"
                           , stringsAsFactors = FALSE)

data_set_tree<-data_set2[,1:5]
data_set_tree<-tidyr::pivot_longer(data_set_tree,cols = -State,
                                   names_to = "type", values_to = "total")
data_set_tree<-subset(data_set_tree,State != "Total")
data_set_tree<-as.data.frame(data_set_tree)
Data<-data_set_tree[order(data_set_tree[,1]),]
# Data<-NULL

data_state_daily_c<-data_state_daily %>% dplyr::filter(Status == "Confirmed" )
data_state_daily_r<-data_state_daily %>% dplyr::filter(Status == "Recovered" )
data_state_daily_d<-data_state_daily %>% dplyr::filter(Status == "Deceased" )

# data1<-subset(Data,State !="India")
# data1<- data1 %>%
#   dplyr::group_by(Date,confirmed)
