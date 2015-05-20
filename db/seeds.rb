require 'faker'
 
 # Create Posts
 50.times do
   Post.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end

if Post.where( title: "bleh", body: "also bleh" ).count ==0
  Post.create(
      title: "bleh",
      body: "also bleh"
    )
end
 
  p = Post.find_or_create_by!(
      title: "bleh",
      body: "also bleh"
    )

 posts = Post.all
 
 # Create Comments
 100.times do
   Comment.create!(
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end

 Comment.find_or_create_by!(
      post: p,
      body: "also bleh"
    )

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
