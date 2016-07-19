class UsersController < ApplicationController

  def index
    client = Octokit::Client.new(:access_token => ENV["octokit_token"])
    @repos = client.search_repos(params[:character] || "wolverine")[:items]
  end

end
