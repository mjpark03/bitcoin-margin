require 'test_helper'

class BitcoinsControllerTest < ActionController::TestCase
  setup do
    @bitcoin = bitcoins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bitcoins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bitcoin" do
    assert_difference('Bitcoin.count') do
      post :create, bitcoin: { company: @bitcoin.company, last: @bitcoin.last }
    end

    assert_redirected_to bitcoin_path(assigns(:bitcoin))
  end

  test "should show bitcoin" do
    get :show, id: @bitcoin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bitcoin
    assert_response :success
  end

  test "should update bitcoin" do
    patch :update, id: @bitcoin, bitcoin: { company: @bitcoin.company, last: @bitcoin.last }
    assert_redirected_to bitcoin_path(assigns(:bitcoin))
  end

  test "should destroy bitcoin" do
    assert_difference('Bitcoin.count', -1) do
      delete :destroy, id: @bitcoin
    end

    assert_redirected_to bitcoins_path
  end
end
