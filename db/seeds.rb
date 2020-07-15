(1..5).to_a.each do |num|
    Dream.create(title: "Dream #{num}", date: Time.now, genre: "Comedy", dream: "I was killin it at a comedy club", theme: "n/a")
end

# Dream.all.each do |dream|
#     dream.update(user_id: [1,2].sample)
# end