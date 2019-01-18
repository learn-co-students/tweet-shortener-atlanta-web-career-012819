def dictionary (word)
  dictionary = {
    "hi" => "hello",
    '2' => ["to", "two", "too"],
    '4' => ["for", "four"],
    'b' => "be",
    'u' => "you",
    "@" => "at",
    "&" => "and"
  }
  dictionary.each do |key, value|
      if dictionary[key] === word.downcase
        return key
      elsif dictionary[key].is_a?(Array)
        if dictionary[key].include?(word.downcase)
          return key
        end
      end
    end
   word
 end

 def word_substituter(tweet)
   new_tweet = tweet.split.map! do |word|
     dictionary(word)
   end
   new_tweet.join(" ")
 end

 def bulk_tweet_shortener(tweet_array)
   tweet_array.collect do |tweet|
     puts word_substituter(tweet)
   end
 end

 def selective_tweet_shortener(tweet)
   if tweet.length > 140
      word_substituter(tweet)
   else
     tweet
   end
 end

 def shortened_tweet_truncator (tweet)
   shortened = word_substituter(tweet)
   if shortened.length > 140
     shortened[0..136].concat("...")
   else
     shortened
   end
 end 
