class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    session[:token] = GithubService.new.authenticate!(
      ENV['GITHUB_CLIENT'],
      ENV['GITHUB_SECRET'],
      params[:code]
    )

    session[:username] = GithubService
      .new("access_token" => session[:token])
      .get_username

    redirect_to '/'
  end
end
