movies = {"Star Wars: The Empire Strikes Back" => 97,
    "Momento" => 83,
    "Spice World" => 4,
    "Silence of the Lambs" => 98,
    "Nightcrawler" => 64,
    "Star Trek: First Contact" => 92,
    "Wayne's World" => 77,
    "Problem Child" => 9,
    "Dark City" => 87,
    "Austin Powers: Spy Who Shagged Me" => 39,
    "Snakes on a Plane" => 15,
    "Anaconda" => 28, 
    "Star Wars: Phantom Menace" => 72,
    "The Fast and the Furious" => 66,
    "The Count of Monte Cristo" => 85,
    "Mall Cop" => 22,
    "The Incredibles" => 91
}

new_movies = {"She Devil" => 46,
    "Batman and Robin" => 31,
    "True Lies" => 76,
    "Kindergarden Cop" => 56,
    "Tango and Cash" => 34,
    "Rainman" => 81,
    "Cliffhanger" => 59
}

movies.merge!(new_movies)

puts movies.select{ |k, v| v < 30}
puts movies.values
