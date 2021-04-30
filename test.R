ui = fluidPage(theme = shinytheme('slate'),
               navbarPage('Social Media',
                          tabPanel('Facebook',
                                   titlePanel('Facebook Influencers'),
                                   mainPanel(
                                     tabsetPanel(
                                       tabPanel("Fan and Engagement", 
                                                plotlyOutput("fbFan"),
                                                plotlyOutput("fbEng")),
                                       tabPanel("Top5 Influencers and Date", 
                                                plotlyOutput("fbFanDate"),
                                                plotlyOutput("fbEngDate"))
                                     )
                                   )
                          ),
                          tabPanel('Instagram',
                                   titlePanel('Instagram Influencers'),
                                   mainPanel(
                                     tabsetPanel(
                                       tabPanel("Fan and Engagement", 
                                                plotlyOutput("igFan"),
                                                plotlyOutput("igEng")),
                                       tabPanel("Top5 Influencers and Date", 
                                                plotlyOutput("igFanDate"),
                                                plotlyOutput("igEngDate"))
                                     )
                                   )
                          ),
                          tabPanel('Twitter',
                                   titlePanel('Twitter Influencers'),
                                   mainPanel(
                                     tabsetPanel(
                                       tabPanel("Fan and Engagement", 
                                                plotlyOutput("ttFan"),
                                                plotlyOutput("ttEng")),
                                       tabPanel("Top5 Influencers and Date", 
                                                plotlyOutput("ttFanDate"),
                                                plotlyOutput("ttEngDate"))
                                     )
                                   )
                          ),
                          tabPanel('Youtube',
                                   titlePanel('Youtube Influencers'),
                                   mainPanel(
                                     tabsetPanel(
                                       tabPanel("Fan and Engagement", 
                                                plotlyOutput("ytFan"),
                                                plotlyOutput("ytEng")),
                                       tabPanel("Top5 Influencers and Date", 
                                                plotlyOutput("ytFanDate"),
                                                plotlyOutput("ytEngDate"))
                                     )
                                   )
                          )
                          
               )
)