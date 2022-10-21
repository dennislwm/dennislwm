library(tweetrmd)
library(rtweet)

lasttweet_token <- function() {
  create_token(
    "github-readme-last-tweet",
    consumer_key = Sys.getenv("CONSUMER_KEY"),
    consumer_secret = Sys.getenv("CONSUMER_SECRET"),
    access_token = Sys.getenv("ACCESS_TOKEN"),
    access_secret = Sys.getenv("ACCESS_SECRET"),
    set_renv = FALSE
  )
}

handle <- "hypowork"
recent_tweets <- get_timeline(handle, n = 1, token = lasttweet_token())
attributes(recent_tweets)
recent_tweets$id
recent_tweets$in_reply_to_status_id
recent_tweets$in_reply_to_user_id
recent_tweets$quoted_status_id
recent_tweets$status_id

tmpimg <- "tweet.png"
tweet_screenshot(
  tweet_url(handle, recent_tweets$quoted_status_id),
  scale = 5, 
  maxwidth = 600,
  theme = "light",
  hide_media = TRUE,
  file = tmpimg
)
