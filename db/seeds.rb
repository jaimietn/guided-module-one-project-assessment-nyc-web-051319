Podcast.destroy_all
Listener.destroy_all
Review.destroy_all

#listeners
puts "Creating Listeners"
l1 = Listener.create(:name=>'Jaimie')
l2 = Listener.create(:name=>'Sophia')
l3 = Listener.create(:name=>'Yana')
l4 = Listener.create(:name=>'Emi')
l5 = Listener.create(:name=>'Amy')
l6 = Listener.create(:name=>'Mary')
l7 = Listener.create(:name=>'Dean')
l8 = Listener.create(:name=>'Elma')
l9 = Listener.create(:name=>'Monkey')
puts "Finished Creating Listeners"

#podcasts
puts "Creating Podcasts"
p1 = Podcast.create(:name=>'Comedy Bang Bang', :genre=>'comedy', :host=>'Scott Aukerman', :description=>'Join host Scott Aukerman (“Comedy Bang! Bang!” on IFC, “Mr. Show”) for a weekly podcast that blends conversation and character work from today’s funniest comedians. While Scott begins by traditionally interviewing the celebrities, the open-door policy means an assortment of eccentric oddballs can pop by at any moment to chat, compete in games, and engage in comic revelry. With all that, and regular bonus episodes, we bet your favorite part will still be the plugs!', :year_started=> 2009, :still_active=> true, :day_released=>'Sunday')

p2 = Podcast.create(:name=>'The Daily', :genre=>'news', :host=>'Michael Barbaro', :description=>'20-minute daily news briefing by the New York Times.', :year_started=> 2017, :still_active=> true, :day_released=>'daily')

p3 = Podcast.create(:name=>'My Favorite Murder', :genre=>'true crime', :host=>'Karen Kilgariff and Georgia Hardstark', :description=>'Lifelong fans of true crime stories Karen Kilgariff and Georgia Hardstark tell each other their favorite tales of murder and hear hometown crime stories from friends and fans.', :year_started=> 2016, :still_active=> true, :day_released=>'Thursday')

p4 = Podcast.create(:name=>'Everything Iconic', :genre=>'entertainment', :host=>'Danny Pellegrino', :description=>'Everything Iconic with Danny Pellegrino breaks down reality TV and iconic pop culture moments. Special guests deep dive with Danny into the topics we all care about-- Real Housewives, romantic comedies, pop music, actresses over 50, and whatever else he wants to talk about. :)', :year_started=> 2017, :still_active=> true, :day_released=>'Sunday')

p5 = Podcast.create(:name=>'Hollywood Handbook', :genre=>'comedy', :host=>'Sean Clements and Hayes Davenport', :description=>'Hollywood Handbook is an insider’s guide to achieving your showbiz dreams from two A-List it-boys who are living theirs. Hayes and Sean provide an exclusive VIP backstage pass into Tinseltown politics, answer questions from unsuccessful listeners, and bring in famous guests to discuss their craft and how they became what they are (famous).', :year_started=> 2013, :still_active=> true,  :day_released=>'Tuesday')

p6 = Podcast.create(:name=>'Reality Show Show', :genre=>'entertainment', :host=>'Sean Clements and Hayes Davenport', :description=>'Hayes and Sean are two chilled out bros who love watching reality television. In this podcast they relive the past week’s best moments, and prove once and for all that reality doesn’t bites. Cool people and reality stars stop by to play games and dish on their favorite shows.', :year_started=> 2012, :still_active=> false, :day_released=>'no longer active')
# how_did_this_get_made = Podcast.create(:name=>'How Did This Get Made?', :genre=>'', :host=>'', :description=>'', :year_started=> , :still_active=> true, :day_released=>'')
# doughboys = Podcast.create(:name=>'Doughboys', :genre=>'', :host=>'', :description=>'', :year_started=> , :still_active=> true, :day_released=>'')

# last_podcast_on_the_left - Podcast.create(:name=>'Last Podcast On The Left', :genre=>'', :host=>'', :description=>'', :year_started=> , :still_active=> true, :day_released=>'')
# lore = Podcast.create(:name=>'Lore', :genre=>'', :host=>'', :description=>'', :year_started=> , :still_active=> true, :day_released=>'')
# pod_save_america = Podcast.create(:name=>'Pod Save America', :genre=>'', :host=>'', :description=>'', :year_started=> , :still_active=> true, :day_released=>'')
puts "Finished Creating Podcasts"

#reviews
puts "Creating Reviews"
rev1 = Review.create(:podcast_id=>p1.id, :listener_id=>l1.id, :content=>'Jason should be a permanent host.')
rev2 = Review.create(:podcast_id=>p2.id, :listener_id=>l2.id, :content=>'I wish The Daily would go back to its previous format.')
rev3 = Review.create(:podcast_id=>p3.id, :listener_id=>l3.id, :content=>'MFM has gotten so annoying! Unsubscribe!')
puts "Finished Creating Reviews"
