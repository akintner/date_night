require "minitest/autorun"
require "minitest/pride"
require_relative "binary_search_tree"
require "pry"
require_relative "node"

class BinarySearchTreeTest < MiniTest::Test
    def test_it_accepts_root_node
        tree = BinarySearchTree.new
        tree.insert(61, "Bill and Ted")
        assert_instance_of Node, tree.root
        assert_equal 61, tree.root.score
        assert_equal "Bill and Ted", tree.root.movie
    end

    def test_it_accepts_left_and_right_nodes
        tree = BinarySearchTree.new
        tree.insert(61, "Bill and Ted")
        tree.insert(12, "Snakes on a Plane") 
        assert_instance_of Node, tree.root.left
        assert_equal 61, tree.root.score
        tree.insert(89, "Star Wars: A New Hope") 
        assert_instance_of Node, tree.root.right
        assert_equal 12, tree.root.left.score
        assert_equal "Star Wars: A New Hope", tree.root.right.movie
    end

    def test_it_accepts_left_node_again
        tree = BinarySearchTree.new
        tree.insert(61, "Bill and Ted")
        assert_equal 61, tree.root.score
        tree.insert(12, "Snakes on a Plane") 
        tree.insert(4, "Spice World")
        assert_equal 12, tree.root.left.score
        assert_equal 4, tree.current_node.left.score
    end

    def test_it_accepts_right_node_again
        tree = BinarySearchTree.new
        tree.insert(61, "Bill and Ted")
        assert_equal 61, tree.root.score
        tree.insert(89, "Star Wars") 
        assert_equal 89, tree.root.right.score
        tree.insert(95, "Silence of the Lambs")
        assert_equal 95, tree.current_node.right.score
    end

    def test_it_accepts_center_nodes
        tree = BinarySearchTree.new
        tree.insert(61, "Bill and Ted")
        tree.insert(12, "Snakes on a Plane") 
        tree.insert(4, "Spice World")
        tree.insert(41, "Mall Cop")
        assert_equal 12, tree.current_node.score
        assert_equal 41, tree.current_node.right.score
    end

    def test_we_can_search_include?
        tree = BinarySearchTree.new
        tree.insert(61, "Bill and Ted")
        tree.insert(12, "Snakes on a Plane")
        tree.insert(4, "Spice World")
        tree.insert(89, "Star Wars") 
        tree.insert(95, "Silence of the Lambs")
        assert_equal true, tree.include?(89)
    end

    def test_we_have_height_and_depth
        tree = BinarySearchTree.new
        tree.insert(61, "Bill and Ted")
        tree.insert(12, "Snakes on a Plane")
        tree.insert(4, "Spice World")
        tree.insert(89, "Star Wars") 
        tree.insert(95, "Silence of the Lambs")
        assert_equal 3, tree.height
        assert_equal 5, tree.depth_of(95)
    end

    def test_we_find_max_and_min
        tree = BinarySearchTree.new
        tree.insert(61, "Bill and Ted")
        tree.insert(12, "Snakes on a Plane")
        tree.insert(89, "Star Wars") 
        tree.insert(4, "Spice World")
        tree.insert(95, "Silence of the Lambs")
        assert_equal 95, tree.max
        assert_equal 4, tree.min
    end

    def test_we_can_load_file_and_count_insertions
        tree = BinarySearchTree.new
        tree.load
        assert_equal 7, tree.load.movies_inserted
    end

    def test_we_can_sort_the_movies
        tree = BinarySearchTree.new
        tree.insert(61, "Bill and Ted")
        tree.insert(12, "Snakes on a Plane")
        tree.insert(89, "Star Wars") 
        tree.insert(4, "Spice World")
        tree.insert(95, "Silence of the Lambs")
        assert_instance_of Array, tree.sort(61)
    end
    
end
