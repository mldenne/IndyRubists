class UsersController < ApplicationController

  def index
    client = Octokit::Client.new(:access_token => ENV["octokit_token"])
    @users = client.search_users("location:Indianapolis language:Ruby", page: params[:page], sort: "joined", order: "asc")[:items]
    @users = @users.map { |user| client.user(user.login) }
    total_count = client.search_users("location:Indianapolis language:Ruby")[:total_count]
    @pages = (total_count / 30.0).ceil
  end

end
