# Write your code here.
require 'pry'
def words_dict()
words_dict = {
  "hello" => 'hi',
  "to" => '2',
  "two" => '2',
  "too" => '2',
  "for" => '4',
  "For" => '4',
  "four" => '4',
  "be" => 'b',
  "you" => 'u',
  "at" => '@',
  "and" => '&'
  
}
end

def word_substituter(tweet)
  words = tweet.split()
  new_tweet = words.map do |w|
    if words_dict.keys.include?(w)
      words_dict[w.downcase]
      
    else
      w
      
    end
  end #end map
  
  return new_tweet.join(' ')
end

def bulk_tweet_shortener(tweet_list)

  tweet_list.each{|tweet| puts word_substituter(tweet)}
end

def selective_tweet_shortener(tweet)
  if tweet.length() > 140
    word_substituter(tweet)
  else
    tweet
  end
end

def shortened_tweet_truncator(tweet)
  #add an ellipsis if the twee is too long!
  #binding.pry
  if selective_tweet_shortener(tweet).length > 140
    tweet = tweet.slice(0,137) << "..."
    #tweet << "..."
  else
    tweet
  end
end
