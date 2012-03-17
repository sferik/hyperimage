require 'test_helper'

module Hyperimage

  class ImageTest < ActiveSupport::TestCase

    test 'root' do
      assert_kind_of Pathname, Hyperimage::Image.root
      assert_match /app\/assets\/images$/, Hyperimage::Image.root.to_s
    end

    test 'exist?' do
      assert Hyperimage::Image.exist?('owl')
      assert Hyperimage::Image.exist?('owl', 'gif')
      assert Hyperimage::Image.exist?('owl', 'png')
      assert Hyperimage::Image.exist?('owl', 'png', 0)
      assert Hyperimage::Image.exist?('owl', 'png', 1)
      assert Hyperimage::Image.exist?('owl', 'png', 2)
      assert Hyperimage::Image.exist?('owl', 'png', 3)
      assert !Hyperimage::Image.exist?('owl', 'png', 4)
      assert !Hyperimage::Image.exist?('owl', 'jpg')
    end

    test 'exists?' do
      assert Hyperimage::Image.exists?('owl')
      assert Hyperimage::Image.exists?('owl', 'gif')
      assert Hyperimage::Image.exists?('owl', 'png')
      assert Hyperimage::Image.exists?('owl', 'png', 0)
      assert Hyperimage::Image.exists?('owl', 'png', 1)
      assert Hyperimage::Image.exists?('owl', 'png', 2)
      assert Hyperimage::Image.exists?('owl', 'png', 3)
      assert !Hyperimage::Image.exists?('owl', 'png', 4)
      assert !Hyperimage::Image.exists?('owl', 'jpg')
    end

    test 'first' do
      assert_kind_of String, Hyperimage::Image.first('owl')
      assert_not_nil Hyperimage::Image.first('owl')
      assert_not_nil Hyperimage::Image.first('owl', 'gif')
      assert_not_nil Hyperimage::Image.first('owl', 'png')
      assert_not_nil Hyperimage::Image.first('owl', 'png', 0)
      assert_not_nil Hyperimage::Image.first('owl', 'png', 1)
      assert_not_nil Hyperimage::Image.first('owl', 'png', 2)
      assert_not_nil Hyperimage::Image.first('owl', 'png', 3)
      assert_nil Hyperimage::Image.first('owl', 'png', 4)
      assert_nil Hyperimage::Image.first('owl', 'jpg')
    end

    test 'all' do
      assert_kind_of String, Hyperimage::Image.all('owl').first
      assert_equal 5, Hyperimage::Image.all('owl').count
      assert_equal 1, Hyperimage::Image.all('owl', 'gif').count
      assert_equal 4, Hyperimage::Image.all('owl', 'png').count
      assert_equal 1, Hyperimage::Image.all('owl', 'png', 0).count
      assert_equal 1, Hyperimage::Image.all('owl', 'png', 1).count
      assert_equal 1, Hyperimage::Image.all('owl', 'png', 2).count
      assert_equal 1, Hyperimage::Image.all('owl', 'png', 3).count
      assert_equal 0, Hyperimage::Image.all('owl', 'png', 4).count
      assert_equal [], Hyperimage::Image.all('owl', 'jpg')
    end

  end

end
