import tweepy

consumer_key = "zrt5b5UXCx4l9IufAlcHjjlH2";
#eg: consumer_key = "YisfFjiodKtojtUvW4MSEcPm";


consumer_secret = "EeOjkhwZC0W0YliWpnLovzXegYjws0I4VjKwk69gfjFHGVgIYZ";
#eg: consumer_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token = "2369802380-GaB9MKLW7VyJJjuoANTjAeKaPbDaOjGMgY25XkE";
#eg: access_token = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token_secret = "PiUEGkBaTqrn28UaYnTym0EVdCGR3nTVZNPlGTYTDTRCj";
#eg: access_token_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)
