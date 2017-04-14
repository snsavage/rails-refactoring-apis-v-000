class RepositoriesController < ApplicationController
  def index
    @repos_array = GithubService
      .new("access_token" => session[:token])
      .get_repos
  end

  def create
    GithubService
      .new("access_token" => session[:token])
      .create_repo(params[:name])

    redirect_to '/'
  end
end
