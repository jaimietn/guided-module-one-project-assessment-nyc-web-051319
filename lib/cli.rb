class CLI
  attr_accessor :listener, :review, :podcast

  def greet
    puts " "
    puts "Welcome to PodReview!"
    puts " "
    puts "**************************"
    puts " "
    puts "Read and write reviews for all of your favorite (or not so favorite) podcasts."
    puts " "
    puts "**************************"
    puts " "
    puts "Let's get started!"
    puts "First, tell us your name: "
    puts " "
    listener_name = gets.chomp
    @listener = Listener.find_or_create_by(name: listener_name)
    show_menu
  end

  def show_menu
    puts " "
    puts "Hi #{@listener.name}! Let us know what you'd like to do by inputting one of these commands:"
    puts " "
    puts " - Review: to write a new review"
    puts " - Profile: to read and edit your past reviews"
    puts " - Search: to search our database of reviews"
    puts " - Exit: to exit the program"
    puts " "

    get_menu_input
  end

  def get_menu_input
    input = gets.chomp
    if input == "Review" || input == "review"
      puts "Which podcast do you want to write a review for?"
      puts " "
      podcast_name = gets.chomp
      podcast = Podcast.find_or_create_by(name: podcast_name)
      puts "Write your review!"
      puts " "
      content = gets.chomp
      new_review = Review.create(:podcast_id=>podcast.id, :listener_id=>@listener.id, :content=>content)
      puts "Thanks for your review! Here it is: "
      puts " "
      puts "Podcast: #{podcast_name}"
      puts "Content: #{new_review.content} "
      puts " "
      sleep (3)
    elsif input == "Profile" || input == "profile"
      # want option for listeners with no reviews
      if @listener.reviews == []
        puts "You don't have any reviews yet! Type 'Review' to write one."
      else
        puts "Here are all of your current reviews: "
        puts " "
        Review.show_all_reviews_by_listener(@listener)
        sleep (3)
        puts " "
        puts "Would you like to edit or remove any of your reviews?"
        puts "Enter 'Yes' or 'No'"
        puts " "
        edit_response = gets.chomp
          if edit_response == "Yes" || edit_response == "yes"
            puts "Would you like to edit or delete a review? Type 'Edit' or 'Delete.'"
            puts " "
            edit_or_delete = gets.chomp
            if edit_or_delete == "Edit" || edit_or_delete == "edit"
              puts "Which review would you like to edit? Type the number: "
              puts " "
              edit_review_id = gets.chomp
              puts "Please type your new review:"
              puts " "
              new_content = gets.chomp
              Review.user_edit_review(edit_review_id, new_content)
              puts "Thanks! We've updated your review. Type 'Profile' to see all of your current reviews."
              sleep (3)
              puts " "
            elsif edit_or_delete == "Delete" || edit_or_delete == "delete"
              puts "Which review would you like to delete? Type the number: "
              puts " "
              delete_review_id = gets.chomp
              Review.user_delete_review(delete_review_id)
              puts "Your review has been deleted!"
              puts " "
              sleep (3)
            else
              puts "Not sure what you mean! Please enter 'Edit' or 'Delete'"
        end #ends edit or delete yes
        elsif
          edit_response == "No" || edit_response == "no"
          puts "Cool! You're all set :) "
        else
          puts "Not sure what you mean! Please enter 'Yes' or 'No'"
        end
      end
    elsif input == "Search" || input == "search"
      puts "Here are all of the shows we currently have reviews for: "
      puts " "
      Review.show_all_podcasts_names
      sleep (3)
      puts " "
      puts "Not seeing the podcast you're looking for? That means it doesn't have any reviews yet. Type 'Review' to write one!"
      puts " "
      puts "Enter one of the podcasts above to see its reviews: "
      puts " "
      podcast_name = gets.chomp
      Review.show_all_reviews_by_podcast(podcast_name)
      sleep (3)
    elsif input == "Exit" || input == "exit"
      exit!
    else
      puts "Not sure what you're looking for!"
      puts "Please enter 'Review', 'Profile', 'Search', or 'Exit'."
    end
    show_menu
  end #end get_menu_input

end #end class
