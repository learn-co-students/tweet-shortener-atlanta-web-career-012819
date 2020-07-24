def dictionary
	dictionary = {
		"hello" => "hi",
		"to" => "2",
		"two" => "2",
		"too" => "2",
		"for" => "4",
		"four" => "4",
		"be" => "b",
		"you" => "u",
		"at" => "@",
		"and" => "&"
	}
end

def word_substituter(tweet)
	tweet_words = tweet.split(" ")
	tweet_subs = tweet_words.collect {
		|word| dictionary.keys.include?(word.downcase) ? dictionary[word.downcase] : word
	}
	tweet_subs.join(" ")
end

def bulk_tweet_shortener(tweets)
	short_tweets = tweets.collect { |tweet| word_substituter(tweet) }
	short_tweets.each { |tweet| puts tweet }
end

def selective_tweet_shortener(tweet)
	if tweet.length > 140
		word_substituter(tweet)
	else
		tweet
	end
end

def shortened_tweet_truncator(tweet)
	new_tweet = selective_tweet_shortener(tweet)
	if new_tweet.length > 140
		new_tweet[0..136] + "..."
	else
		new_tweet
	end
end