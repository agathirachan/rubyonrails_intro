require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest
  test "get new category form and create category" do
    get "/categories/new"
    assert_response :success
    
    # make sure number of categories has gone up by one
    assert_difference "Category.count", 1 do 
      post categories_path, params: {category: {name: "Sports"}}
      # shoud be redirected to another page
      assert_response :redirect
    end
    # following the redirect
    follow_redirect!
    assert_response :success
    # if success in html body check for "Sports"
    assert_match "Sports", response.body
  end
end
