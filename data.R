################
#---Facebook---#
################

facebook1df = read.csv("C:/Users/ACER/Desktop/datainfo/Facebook_Data_Q1.csv")
facebook2df = read.csv("C:/Users/ACER/Desktop/datainfo/Facebook_Data_Q2.csv")
facebook3df = read.csv("C:/Users/ACER/Desktop/datainfo/Facebook_Data_Q3.csv")
facebook4df = read.csv("C:/Users/ACER/Desktop/datainfo/Facebook_Data_Q4.csv")


facebookdf = rbind(facebook1df,facebook2df,facebook3df,facebook4df)

fbgroup = ddply(facebookdf, "account_username", summarise , 
                fbreac= mean(reaction),
                fbshare = mean(share), 
                fbengage = mean(engagement), 
                fbfan = max(fan))
#####################
#---Data Cleaning---#
#####################

#look
fbclean = fbgroup[grep("à",fbgroup$account_username),]
fbsep = separate(fbclean,account_username, c("username","useless"),sep = 'à')

#****real****#
fbrealsep = separate(fbgroup,account_username, c("account_user","useless"),sep = 'à')
fbremove = fbrealsep[fbrealsep$account_user != ""&fbrealsep$account_user !='"',]

#convert fbfan to numeric
fbremove$fbfan = as.numeric(as.character(fbremove$fbfan))

#############
#---order---# 
#############

#by fan
fbgrouporderfan =  fbremove[order(fbremove$fbfan,decreasing = TRUE),]
glimpse(fbgrouporderfan)
fbgrouporderfan50 = fbgrouporderfan[1:50,]

#by engagement
fbgrouporderengage =  fbremove[order(fbremove$fbengage,decreasing = TRUE),]
fbgrouporderengage50 = fbgrouporderfan[1:50,]

#********************#
#***Change on Date***#
#********************#

fbfilter0 = facebookdf[facebookdf$account_username %in% 
                         c("Lowcostcosplay","SALE HERE",
                           "wongnai.com"
                           ,"Unseen Tour Thailand"),]

fbinflu3 = facebookdf[grep("^Starvingtime",facebookdf$account_username),]
fbinflu3$fan = as.numeric(as.character(fbinflu3$fan))

fbrealsepinflu3 = separate(fbinflu3,account_username, 
                           c("account_username","useless"),sep = 'à')
drop = c("useless")
fbdrop = fbrealsepinflu3[ ,(names(fbrealsepinflu3) != drop)]

fbfilter = rbind(fbfilter0,fbdrop)

fbfilgrp = ddply(fbfilter, c("account_username","created_at"), summarise , 
                 fbreac= as.numeric(mean(reaction)),
                 fbshare = as.numeric(mean(share)), 
                 fbengage = as.numeric(mean(engagement)), 
                 fbfan = as.numeric(max(fan))
)

fbfilgrp$date = as.Date(fbfilgrp$created_at, '%Y-%m-%d')
fbfilsepdate = separate(fbfilgrp,date,c("year","month","day"),sep = "-")

fbfilsepdate$year = as.integer(fbfilsepdate$year)
fbfilsepdate$month = as.integer(fbfilsepdate$month)
fbfilsepdate$day = as.integer(fbfilsepdate$day)

fbfilsepdategrp = ddply(fbfilsepdate, c("account_username","day"), summarise , 
                        fbreac0 = mean(fbreac),
                        fbshare0 = mean(fbshare), 
                        fbeng0 = mean(fbengage), 
                        fbfan0 = max(fbfan))



#################
#---Instagram---#
#################

instagramdf = read.csv("C:/Users/ACER/Desktop/datainfo/Instagram_Data.csv")

iggroup = ddply(instagramdf, c("account_username"),summarise, 
                igeng = mean(engagement),
                iglike = mean(like),
                igfan=max(fan))

###########
#--order--#
###########
#sort by fan
iggrouporderfan = iggroup[order(-iggroup$igfan),]
iggrouporderfan50 =iggrouporderfan[1:50,]

#sort by engagement
iggroupordereng = iggroup[order(-iggroup$igeng),]
iggroupordereng50 =iggroupordereng[1:50,]

#********************#
#***Change on Date***#
#********************#

igfilter = instagramdf[instagramdf$account_username %in% 
                         c("pimtha","kaykai_ntch",
                           "vanda29","greenpeace"
                           ,"thisisbebe"),]


igfilgrp = ddply(igfilter, c("account_username","created_at"), summarise , 
                 igeng = as.numeric(mean(engagement)),
                 iglike = as.numeric(mean(like)),
                 igfan= as.numeric(mean(fan))
)

igfilgrp$date = as.Date(igfilgrp$created_at, '%Y-%m-%d')
igfilsepdate = separate(igfilgrp,date,c("year","month","day"),sep = "-")

igfilsepdate$year = as.integer(igfilsepdate$year)
igfilsepdate$month = as.integer(igfilsepdate$month)
igfilsepdate$day = as.integer(igfilsepdate$day)


igfilsepdategrp = ddply(igfilsepdate, c("account_username","month"), summarise , 
                        igeng0 = mean(igeng),
                        iglike0 = mean(iglike),
                        igfan0 = mean(igfan))

###############
#---Twitter---#
###############

twitterdf = read.csv("C:/Users/ACER/Desktop/datainfo/Twitter_Data.csv")
names(twitterdf)

twitdforder = twitterdf[order(twitterdf$account_username),c(4,9,10,12,17)]

ttgroup = ddply(twitterdf, "account_username", summarise , 
                ttfav = mean(favorite),
                ttre = mean(retweet) , 
                tteng = mean(engagement), 
                ttfan = max(fan))

#############
#---order---#
#############

#fan
ttgrouporderfan =  ttgroup[order(-ttgroup$ttfan),]
ttgrouporderfan50 = ttgrouporderfan[1:50,]

#engagement
ttgroupordereng =  ttgroup[order(-ttgroup$tteng),]
ttgroupordereng50 = ttgroupordereng[1:50,]

#********************#
#***Change on Date***#
#********************#


ttfilter = twitterdf[twitterdf$account_username %in% 
                       c("UnderbedDara","THarmharm",
                         "samakhom","wongnai"
                         ,"kidmakk"),]


ttfilgrp = ddply(ttfilter, c("account_username","created_at"), summarise , 
                 ttfav = as.numeric(mean(favorite)),
                 ttre = as.numeric(mean(retweet)) , 
                 tteng = as.numeric(mean(engagement)), 
                 ttfan = as.numeric(max(fan)))


ttfilgrp$date = as.Date(ttfilgrp$created_at, '%Y-%m-%d')
ttfilsepdate = separate(ttfilgrp,date,c("year","month","day"),sep = "-")

ttfilsepdate$year = as.integer(ttfilsepdate$year)
ttfilsepdate$month = as.integer(ttfilsepdate$month)
ttfilsepdate$day = as.integer(ttfilsepdate$day)


ttfilsepdategrp = ddply(ttfilsepdate, c("account_username","month"), summarise , 
                        ttfav0 = mean(ttfav),
                        ttre0 = mean(ttre), 
                        tteng0 = mean(tteng), 
                        ttfan0 = max(ttfan))

###############
#---Youtube---#
###############

youtubedf = read.csv("C:/Users/ACER/Desktop/datainfo/YouTube_Data.csv")


ytgroup = ddply(youtubedf, "account_username", summarise , 
                ytlike= mean(like),
                ytview = mean(view), 
                ytengage = mean(engagement), 
                ytfan = max(fan))


#####################
#---Data Cleaning---#
#####################

ytrealsep = separate(ytgroup,account_username, c("account_username","useless"),
                     sep = 'à')
ytrealsep = separate(ytrealsep,account_username, c("account_username","useless"),
                     sep = 'ã')

ytremove = ytrealsep[ytrealsep$account_user != ""&ytrealsep$account_user !='"',]

ytremove = ytremove[names(ytremove) != 'useless']



#############
#---order---#
#############

#sort by fan
ytgroup2orderfan = ytremove[order(-ytremove$ytfan),]
ytgroup2orderfan50 =ytgroup2orderfan[1:50,]

#sort by view
ytgroup2orderview = ytremove[order(-ytremove$ytfan),]
ytgroup2orderview50 =ytgroup2orderview[1:50,]

#********************#
#***Change on Date***#
#********************#

ytfilter = youtubedf[youtubedf$account_username %in% 
                       c("Kaykai Salaider","zbing z.",
                         "Bie The Ska","My Mate Nate"
                         ,"UDiEX2"),]


ytfilgrp = ddply(ytfilter, c("account_username","created_at"), summarise , 
                 ytlike= as.numeric(mean(like)),
                 ytview = as.numeric(mean(view)), 
                 ytengage = as.numeric(mean(engagement)), 
                 ytfan = as.numeric(max(fan)))


ytfilgrp$date = as.Date(ytfilgrp$created_at, '%Y-%m-%d')
ytfilsepdate = separate(ytfilgrp,date,c("year","month","day"),sep = "-")

ytfilsepdate$year = as.integer(ytfilsepdate$year)
ytfilsepdate$month = as.integer(ytfilsepdate$month)
ytfilsepdate$day = as.integer(ytfilsepdate$day)


ytfilsepdategrp = ddply(ytfilsepdate, c("account_username","month"), summarise , 
                        ytlike0= mean(ytlike),
                        ytview0 = mean(ytview), 
                        ytengage0 = mean(ytengage), 
                        ytfan0 = max(ytfan))