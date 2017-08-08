import tweepy

consumer_key = "FSS2rOr4dO6WyK6alydkhDCkY";
#eg: consumer_key = "YisfFjiodKtojtUvW4MSEcPm";


consumer_secret = "kLoG1ueg8HiRssGPwZgNgaCEjKuUMgW7iSsl2ZvKkeOElFn4eE";
#eg: consumer_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token = "4798831107-3oOaJ4KcAbps44QuCWalKcIbZpSF6GenOAutMP4";
#eg: access_token = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token_secret = "z0eUXqjGl8Kuzd2eok8h22wari2KSqDvJCCxSyHn1mfso";
#eg: access_token_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)



