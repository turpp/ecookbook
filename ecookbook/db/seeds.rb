user1 = User.create(:username => "ada", :password_digest => "123")
user2 = User.create(:username => "taz", :password_digest => "321")
user3 = User.create(:username => "tripp", :password_digest => "password")

recipe1=Recipe.create(:name=>"Smoked Chuck Roast", :ingredients=>"*chuck roast *yellow onion *beef broth *meat rub *foil and foil pan", :steps=>"*rub meat and let rest over night *put on smoker and smoke for 3hrs *put chuck roast in pan with onion and broth and cook for approx. 3hrs or till 165 *cover with foil and cook to 200. *remove and let rest for 30min" ,:description=>"Mouth watering chuck roast that is savory and will you licking your fingers", :user_id=> 3)
recipe2=Recipe.create(:name=>"Kong Treat", :ingredients=>"*dog treats *peanut butter *banana", :steps=>"*put treats in Kong *put banana in Kong *top with peanut butter" ,:description=>"Ultimate Kong Treat. Has peanutbutter to keep you licking, banana for health and then treats to for desert at the end.", :user_id=> 1)
recipe3=Recipe.create(:name=>"Blueberry dog food", :ingredients=>"*dog food *blueberries", :steps=>"*put dog food in bowl *add blueberries and mix in" ,:description=>"A quick way to add some extra vitamins to your dog food.", :user_id=> 2)


