require "pry"
require_relative "node"

class BinarySearchTree
    attr_accessor   :root, 
                    :nodes, 
                    :current_node,
                    :height
<<<<<<< HEAD
=======
                    
>>>>>>> 565df65c2a9f4b3ffb5d363ae7c5b607eaf9ac89

    def initialize
        @root = nil
        @nodes = []
        @height = -1
        @current_node = @root
    end

    def insert(score, movie)
        if @root.nil?
            @root = Node.new(score, movie)
            @height += 1
        elsif @root.left.nil? && score < @root.score 
            @root.left = Node.new(score, movie)
            @height += 1
        elsif @root.right.nil? && score > @root.score
            @root.right = Node.new(score, movie)
        else 
            fill_left_right_recursion(score, movie)
        end
    end

    def fill_left_right_recursion(score, movie)
        if @root.left && score < @root.left.score 
            @current_node = @root.left
            if @current_node.left.nil? && score < @current_node.score 
                @current_node.left = Node.new(score, movie)
                @height += 1
            end
        elsif @root.right && score > @root.right.score
            @current_node = @root.right
            if @current_node.right.nil? && score > @current_node.score
                @current_node.right = Node.new(score, movie)
                @height += 1
            end
        elsif score == @current_node.score 
            puts "This score already exists in the database. Please rate again and re-try."
        else 
            fill_in_center_recursion(score, movie)
        end 
    end

    def fill_in_center_recursion(score, movie)
        if @current_node && score > @current_node.score 
            if @current_node.right.nil? && score > @current_node.score 
                @current_node.right = Node.new(score, movie)
            end
        elsif @current_node && score < @current_node.score
            if @current_node.left.nil? && score < @current_node.score
                @current_node.left = Node.new(score, movie)
            end
        else 
            score == @current_node.left.score || @current_node.right.score
            puts "This score already exists in the database. Please rate again and re-try."
        end
    end

    def include?(x, current_node=@root)
        node = current_node
        x = x.to_i
        p node.score
        return true if node.score == x
        if x > node.score 
            node = node.right
            return true if node == x                
        end
        if x < node.score 
            node = node.left 
            return true if node == x
        end
        include?(x, node) if !node.nil?
    end

    def max
        node = @root
        movie_max = {}
        while node.right 
            node = node.right
        end
        movie_max[node.movie] = node.score
    end

    def min
        node = @root
        movie_min = {}
        while node.left 
            node = node.left
        end
        movie_min[node.movie] = node.score
    end

    def sort(node = @root)
        sorted_nodes = []
        traverse_and_sort(node, sorted_nodes)
        puts sorted_nodes
    end

    def traverse_and_sort(node, sorted_nodes)
        return if !node
        traverse_and_sort(node.left, sorted_nodes)
        sorted_nodes << Hash[node.movie, node.score]
        traverse_and_sort(node.right, sorted_nodes)
    end

    def depth_of(score, depth=0)
        node = @root
        if node.nil?
            depth
        elsif score == node.score
            depth += 1
            puts "a score of #{score} occurs at depth #{depth}"
        elsif score > node.score
            depth += 1
            puts "a score of #{score} occurs at depth #{depth}"
        elsif score < node.score
            depth += 1
            puts "a score of #{score} occurs at depth #{depth}"
        end
    end

    def load
        movies_inserted = 0
        File.readlines("movies.txt") do |movie|
            movie = movie.chop.split(",")
            if !include?(movie[0].to_i)
                insert(movie[0].to_i, movie[-1])
                movies_inserted += 1
            end
        end
        p movies_inserted
    end

    def health
        "AHHHHHGGGGGGGGG"
    end

end


#  Basic expectations: 1) insert method w/ score, movie and returns depth of trees
# 2) include? to verify or reject presence of a score in the tree
# 3)depth_of to report the depth of the tree in which a score appears (nil if score doesn't exist)
# 4) max for highest score 5)min for lowest - both return movie and score
# 6) sort = return array of all movies and scores in ascending order and returned as array of hashes
# 7)load = load movies.txt w/ return value of #inserted into tree
# 8)health reports on health of tree w/ (score of node, number of children, %nodes that are this or its children)

