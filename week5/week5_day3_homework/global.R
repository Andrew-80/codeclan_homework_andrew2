# function to plot medals

plot_medal <- function(t, s){
  olympics_overall_medals %>% 
    filter(team == t) %>% 
    filter(season == s) %>% 
    ggplot() +
    aes(x = medal, y = count, fill = medal) +
    geom_col()
}
  