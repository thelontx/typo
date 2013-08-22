# Allow population of DB with articles

Given /the following articles exist/ do |articles_table|
  articles_table.hashes.each do |article|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Article.create(article)
  end
end

