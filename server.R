server = function(input,output,session){
  #facebook
  output$fbFan = renderPlotly(ggplotly(
    
    ggplot(fbgrouporderfan, aes(x=fbfan, y=reorder(account_user,fbfan),
                                text = paste0("<b>Account Username: </b>",account_user,"<br>",
                                              "<b>Fan: </b>",fbfan,"<br>"
                                )
    ))+
      geom_bar(stat="identity",fill="thistle1")+
      theme_solarized_2(light = F,base_size = 14, base_family = "Georgia")+
      labs(title = "Influencers order by Fan")+
      xlab("Facebook Fan")+ 
      ylab("Account Username")+
      theme(text=element_text(colour = "oldlace"),
            title = element_text(colour = "oldlace", size =10, face="bold"),
      )
    , tooltip = "text"
  )
  )
  output$fbEng = renderPlotly(ggplotly(
    
    ggplot(fbgrouporderengage, aes(x=fbengage, y=reorder(account_user,fbfan),
                                   text = paste0("<b>Account Username: </b>",account_user,"<br>",
                                                 "<b>Engagement: </b>",fbengage,"<br>"
                                   )
    ))+
      geom_bar(stat="identity",fill="skyblue2")+
      theme_solarized_2(light = T,base_size = 14, base_family = "Georgia")+
      labs(title = "Influencers order by Fan")+
      xlab("Facebook Engagement")+ 
      ylab("Account Username")+
      theme(text=element_text(colour = "rosybrown4"),
            title = element_text(colour = "rosybrown4", size =10, face="bold"),
      )
    , tooltip = "text"
  ))
  output$fbFanDate = renderPlotly(ggplotly(
    ggplot(fbfilsepdategrp,aes(x=day,y=fbfan0,group=account_username, 
                               color=account_username,
                               text = paste0("<b>Account Username: </b>",account_username,"<br>",
                                             "<b>Fan: </b>",fbfan0,"<br>",
                                             "<b>Day/Month/Year: </b>",day,"/12/2020 <br>")
    ))+
      geom_line()+
      geom_path(size = 0.8, lineend = "round")+
      geom_point(size = 1.5)+
      scale_x_continuous("Days of December 2020",breaks = c(1:30))+
      scale_y_continuous("Fan")+
      theme_solarized_2(light = F,base_size = 14, base_family = "Georgia")+
      labs(title = "Fan of Top 5 influencers of Facebook"),
    tooltip = 'text'
  )
  )
  output$fbEngDate = renderPlotly(ggplotly(
    ggplot(fbfilsepdategrp,aes(x=day,y=fbeng0,group=account_username, 
                               color=account_username,
                               text = paste0("<b>Account Username: </b>",account_username,"<br>",
                                             "<b>Engagement: </b>",fbeng0,"<br>",
                                             "<b>Day/Month/Year: </b>",day,"/12/2020 <br>")
    ))+
      geom_line()+
      geom_path(size = 0.8, lineend = "round")+
      geom_point(size = 1.5)+
      scale_x_continuous("Days of December 2020",breaks = c(1:30))+
      scale_y_continuous("Engagement")+
      theme_solarized_2(light = T,base_size = 14, base_family = "Georgia")+
      labs(title = "Engagement of Top 5 influencers of Facebook")
    , tooltip = 'text'
  ))
  
  
  #instagram
  
  
  output$igFan = renderPlotly(ggplotly(
    
    ggplot(iggrouporderfan, aes(x=igfan, y=reorder(account_username,igfan),
                                text = paste0("<b>Account Username: </b>",account_username,"<br>",
                                              "<b>Fan: </b>",igfan,"<br>"
                                )
    ))+
      geom_bar(stat="identity",fill="thistle1")+
      theme_solarized_2(light = F,base_size = 14, base_family = "Georgia")+
      labs(title = "Influencers order by Fan")+
      xlab("Instagram Fan")+ 
      ylab("Account Username")+
      scale_x_continuous(breaks = c(0,1000000,2000000,3000000,4000000),
                         labels = c("0","1M","2M",'3M','4M'))+
      theme(text=element_text(colour = "oldlace"),
            title = element_text(colour = "oldlace", size =10, face="bold"),
      )
    , tooltip = "text"
  ))
  output$igEng = renderPlotly(ggplotly(
    
    ggplot(iggroupordereng, aes(x=igeng, y=reorder(account_username,igeng),
                                text = paste0("<b>Account Username: </b>",account_username,"<br>",
                                              "<b>Engagement: </b>",igeng,"<br>"
                                )
    ))+
      geom_bar(stat="identity",fill="skyblue2")+
      theme_solarized_2(light = T,base_size = 14, base_family = "Georgia")+
      labs(title = "Influencers order by Fan")+
      xlab("Instagram Engagement")+ 
      ylab("Account Username")+
      scale_x_continuous(breaks = c(0,50000,100000,150000),
                         labels = c("0","50,000",'100,000','150,000'))+
      theme(text=element_text(colour = "rosybrown4"),
            title = element_text(colour = "rosybrown4", size =10, face="bold"),
      )
    , tooltip = "text"
  ))
  output$igFanDate = renderPlotly(ggplotly(
    ggplot(igfilsepdategrp,aes(x=month,y=igfan0,group=account_username, 
                               color=account_username,
                               text = paste0("<b>Account Username: </b>",account_username,"<br>",
                                             "<b>Fan: </b>",igfan0,"<br>",
                                             "<b>Month: </b>",month,"/2020 <br>")
    ))+
      geom_line()+
      geom_path(size = 0.8, lineend = "round")+
      geom_point(size = 1.5)+
      scale_x_continuous("Month of 2020",breaks = c(1:12))+
      scale_y_continuous("Fan")+
      theme_solarized_2(light = F,base_size = 14, base_family = "Georgia")+
      labs(title = "Fan of Top 5 influencers on Instagram"),
    tooltip = "text"
  ))
  output$igEngDate = renderPlotly(
    ggplotly(
      ggplot(igfilsepdategrp,aes(x=month,y=igeng0,group=account_username, 
                                 color=account_username,
                                 text = paste0("<b>Account Username: </b>",account_username,"<br>",
                                               "<b>Engagement: </b>",igeng0,"<br>",
                                               "<b>Month: </b>",month,"/2020 <br>")
      ))+
        geom_line()+
        geom_path(size = 0.8, lineend = "round")+
        geom_point(size = 1.5)+
        scale_x_continuous("Month of 2020",breaks = c(1:30))+
        scale_y_continuous("Engagement")+
        theme_solarized_2(light = T,base_size = 14, base_family = "Georgia")+
        labs(title = "Engagement of Top 5 influencers on Instagram")
      ,tooltip = 'text'
    ))
  
  #twitter
  
  output$ttFan = renderPlotly(
    ggplotly(
      
      ggplot(ttgrouporderfan, aes(x=ttfan, y=reorder(account_username,ttfan),
                                  text = paste0("<b>Account Username: </b>",account_username,"<br>",
                                                "<b>Fan: </b>",ttfan,"<br>"
                                  )
      ))+
        geom_bar(stat="identity",fill="thistle1")+
        theme_solarized_2(light = F,base_size = 14, base_family = "Georgia")+
        labs(title = "Influencers order by Fan")+
        xlab("Twitter Fan")+ 
        ylab("Account Username")+
        scale_x_continuous(breaks = c(0,1000000,2000000,
                                      3000000), labels = c("0","1M","2M","3M"))+
        theme(text=element_text(colour = "oldlace"),
              title = element_text(colour = "oldlace", size =10, face="bold"),
        )
      , tooltip = "text"
    )
  )
  
  output$ttEng = renderPlotly(
    ggplotly(
      
      ggplot(ttgroupordereng, aes(x=tteng, y=reorder(account_username,ttfan),
                                  text = paste0("<b>Account Username: </b>",account_username,"<br>",
                                                "<b>Engagement: </b>",tteng,"<br>"
                                  )
      ))+
        geom_bar(stat="identity",fill="skyblue2")+
        theme_solarized_2(light = T,base_size = 14, base_family = "Georgia")+
        labs(title = "Influencers order by Fan")+
        xlab("Twitter Engagement")+ 
        ylab("Account Username")+
        scale_x_continuous(breaks = c(0,5000,10000),
                           labels = c("0","5,000","10,000"))+
        theme(text=element_text(colour = "rosybrown4"),
              title = element_text(colour = "rosybrown4", size =10, face="bold"),
        )
      , tooltip = "text"
    )
  )
  
  output$ttFanDate = renderPlotly(
    ggplotly(
      
      ggplot(ttfilsepdategrp,aes(x=month,y=ttfan0,group=account_username, 
                                 color=account_username,
                                 text = paste0("<b>Account Username: </b>",account_username,"<br>",
                                               "<b>Fan: </b>",ttfan0,"<br>",
                                               "<b>Month: </b>",month,"/2020 <br>")
      ))+
        geom_line()+
        geom_path(size = 0.8, lineend = "round")+
        geom_point(size = 1.5)+
        scale_x_continuous("Month of 2020",breaks = c(1:12))+
        scale_y_continuous("Fan",breaks = c(2500000,3000000), labels = c('2,500,000','3,000,000'))+
        theme_solarized_2(light = F,base_size = 14, base_family = "Georgia")+
        labs(title = "Fan of Top 5 influencers on Twitter"),
      tooltip = "text"
      
    )  
  )
  output$ttEngDate = renderPlotly(
    ggplotly(
      
      ggplot(ttfilsepdategrp,aes(x=month,y=tteng0,group=account_username, 
                                 color=account_username,
                                 text = paste0("<b>Account Username: </b>",account_username,"<br>",
                                               "<b>Engagement: </b>",tteng0,"<br>",
                                               "<b>Month: </b>",month,"/2020 <br>")
      ))+
        geom_line()+
        geom_path(size = 0.8, lineend = "round")+
        geom_point(size = 1.5)+
        scale_x_continuous("Month of 2020",breaks = c(1:30))+
        scale_y_continuous("Engagement",breaks = c(5000,10000,15000),labels = c('5,000','10,000','15,000'))+
        theme_solarized_2(light = T,base_size = 14, base_family = "Georgia")+
        labs(title = "Engagement of Top 5 influencers on Twitter"),
      tooltip = "text"
    )
    
  )
  
  #youtube
  
  output$ytFan = renderPlotly(ggplotly(
    
    ggplot(ytgroup2orderfan, aes(x=ytfan, y=reorder(account_username,ytfan),
                                 text = paste0("<b>Account Username: </b>",account_username,"<br>",
                                               "<b>Fan: </b>",ytfan,"<br>"
                                 )
    ))+
      geom_bar(stat="identity",fill="thistle1")+
      theme_solarized_2(light = F,base_size = 14, base_family = "Georgia")+
      labs(title = "Influencers order by Fan")+
      xlab("Youtube Fan")+ 
      ylab("Account Username")+
      scale_x_continuous(breaks = c(0,5000000,10000000),
                         labels = c("0","5M","10M"))+
      theme(text=element_text(colour = "oldlace"),
            title = element_text(colour = "oldlace", size =10, face="bold"),
      )
    , tooltip = "text"
  ))
  output$ytEng = renderPlotly(ggplotly(
    
    ggplot(ytgroup2orderview, aes(x=ytview, y=reorder(account_username,ytview),
                                  text = paste0("<b>Account Username: </b>",account_username,"<br>",
                                                "<b>Engagement: </b>",ytview,"<br>"
                                  )
    ))+
      geom_bar(stat="identity",fill="skyblue2")+
      theme_solarized_2(light = T,base_size = 14, base_family = "Georgia")+
      labs(title = "Influencers order by Fan")+
      xlab("Youtube View")+ 
      ylab("Account Username")+
      scale_x_continuous(breaks = c(0,2000000,4000000),
                         labels = c("0","2M","4M"))+
      theme(text=element_text(colour = "rosybrown4"),
            title = element_text(colour = "rosybrown4", size =10, face="bold"),
      )
    , tooltip = "text"
  ))
  output$ytFanDate = renderPlotly(ggplotly(
    ggplot(ytfilsepdategrp,aes(x=month,y=ytfan0,group=account_username, 
                               color=account_username,
                               text = paste0("<b>Account Username: </b>",account_username,"<br>",
                                             "<b>Fan: </b>",ytfan0,"<br>",
                                             "<b>Month: </b>",month,"/2020 <br>")
    ))+
      geom_line()+
      geom_path(size = 0.8, lineend = "round")+
      geom_point(size = 1.5)+
      scale_x_continuous("Month of 2020",breaks = c(1:12))+
      scale_y_continuous("Fan",breaks = c(8000000,10000000,
                                          12000000,14000000),
                         labels = c("8M","10M","12M","14M"))+
      theme_solarized_2(light = F,base_size = 14, base_family = "Georgia")+
      labs(title = "Fan of Top 5 Youtubers"),
    tooltip = "text"
  )
  )
  output$ytEngDate = renderPlotly(ggplotly(ggplot(ytfilsepdategrp,aes(x=month,y=ytview0,group=account_username, 
                                                                      color=account_username,
                                                                      text = paste0("<b>Account Username: </b>",account_username,"<br>",
                                                                                    "<b>View: </b>",ytview0,"<br>",
                                                                                    "<b>Month: </b>",month,"/2020 <br>")
  )
  )+
    geom_line()+
    geom_path(size = 0.8, lineend = "round")+
    geom_point(size = 1.5)+
    scale_x_continuous("Month of 2020",breaks = c(1:30))+
    scale_y_continuous("View",breaks = c(2000000,4000000,6000000,8000000)
                       ,labels = c("2M","4M","6M","8M"))+
    theme_solarized_2(light = T,base_size = 14, base_family = "Georgia")+
    labs(title = "View of Top 5 Youtubers"),
  tooltip = "text"
  ))
  
}

shinyApp(ui,server)







